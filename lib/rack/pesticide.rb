module Rack
  class Pesticide
    def initialize(app)
      @app = app
    end

    def call(env)
      if pest?(env)
        forbidden
      else
        @app.call(env)
      end
    end

    private

    def forbidden
      [403, {"Content-Type" => "text/plain"}, ["Pest, be gone!\r\n"]]
    end

    def pest?(env)
      referer = env['HTTP_REFERER'] || ''
      pests.map { |p| referer =~ p }.any?
    end

    def pests
      @pests ||= load_pests
    end

    def load_pests
      path = ::File.expand_path('../../../data/pests.txt', __FILE__)
      ::File.open(path, 'r') do |fh|
        fh.each_line.map { |line| /#{line.chomp}/ }
      end
    end
  end
end
