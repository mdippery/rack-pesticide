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
      pests = [
        /semalt\.com\/crawler\.php/,
        /semaltmedia\.com/,
        /buttons-for-website\.com/,
        /makemoneyonline\.com/,
        /buttons-for-your-website\.com/,
        /best-seo-offer\.com/,
        /100dollars-seo\.com/,
        /videos-for-your-business\.com/,
        /video--production\.com/,
        /justprofit\.xyz/,
      ]
      referer = env['HTTP_REFERER'] || ''
      pests.map { |p| referer =~ p }.any?
    end
  end
end
