require 'rack-pesticide'
require 'rspec'


describe "rack-pesticide" do
  def app
    Rack::Pesticide.new(nil)
  end

  describe "#pest?" do
    it "should allow 'good' referers" do
      env = {'HTTP_REFERER' => 'http://reddit.com/'}
      app.send(:pest?, env).should be false
    end

    it "should block the semalt.com crawler" do
      env = {'HTTP_REFERER' => 'http://semalt.com/crawler.php'}
      app.send(:pest?, env).should be true
    end

    it "should block buttons-for-website.com" do
      env = {'HTTP_REFERER' => 'http://buttons-for-website.com/'}
      app.send(:pest?, env).should be true
    end

    it "should block makemoneyonline.com" do
      env = {'HTTP_REFERER' => 'http://make-money-online.7makemoneyonline.com/money.php?u=http://monkey-robot.com'}
      app.send(:pest?, env).should be true
    end

    it "should block best-seo-offer.com" do
      env = {'HTTP_REFERER' => 'http://best-seo-offer.com/try.php?u=http://monkey-robot.com'}
      app.send(:pest?, env).should be true
    end

    it "should block buttons-for-your-website.com" do
      env = {'HTTP_REFERER' => 'http://buttons-for-your-website.com/'}
      app.send(:pest?, env).should be true
    end

    it "should block 100dollars-seo.com" do
      env = {'HTTP_REFERER' => 'http://100dollars-seo.com/try.php?u=http://monkey-robot.com'}
      app.send(:pest?, env).should be true
    end

    it "should block videos-for-your-business.com" do
      env = {'HTTP_REFERER' => 'http://videos-for-your-business.com/'}
      app.send(:pest?, env).should be true
    end

    it "should block semaltmedia.com" do
      env = {'HTTP_REFERER' => 'http://semaltmedia.com/'}
      app.send(:pest?, env).should be true
    end

    it "should block video--production.com" do
      env = {'HTTP_REFERER' => 'http://video--production.com/'}
      app.send(:pest?, env).should be true
    end
  end
end
