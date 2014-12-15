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
      [403, {"Content-Type" => "text/plain"}, ["Pest, be gone!\n"]]
    end

    def pest?(env)
      pests = [
        /semalt\.com\/crawler\.php/,
        /buttons-for-website\.com/,
        /makemoneyonline\.com/
      ]
      referer = env['HTTP_REFERER'] || ''
      pests.map { |p| referer =~ p }.any?
    end
  end
end
