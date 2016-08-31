require 'rack'
require 'rack-pesticide'
require 'rspec'


describe "rack-pesticide" do
  def app
    Rack::Pesticide.new(nil)
  end

  describe "#pest?" do
    it "should allow 'good' referers" do
      env = {'HTTP_REFERER' => 'http://reddit.com/'}
      expect(app.send(:pest?, env)).to be false
    end

    it "should block the semalt.com crawler" do
      env = {'HTTP_REFERER' => 'http://semalt.com/crawler.php'}
      expect(app.send(:pest?, env)).to be true
    end

    it "should block buttons-for-website.com" do
      env = {'HTTP_REFERER' => 'http://buttons-for-website.com/'}
      expect(app.send(:pest?, env)).to be true
    end

    it "should block makemoneyonline.com" do
      env = {'HTTP_REFERER' => 'http://make-money-online.7makemoneyonline.com/money.php?u=http://monkey-robot.com'}
      expect(app.send(:pest?, env)).to be true
    end

    it "should block best-seo-offer.com" do
      env = {'HTTP_REFERER' => 'http://best-seo-offer.com/try.php?u=http://monkey-robot.com'}
      expect(app.send(:pest?, env)).to be true
    end

    it "should block buttons-for-your-website.com" do
      env = {'HTTP_REFERER' => 'http://buttons-for-your-website.com/'}
      expect(app.send(:pest?, env)).to be true
    end

    it "should block 100dollars-seo.com" do
      env = {'HTTP_REFERER' => 'http://100dollars-seo.com/try.php?u=http://monkey-robot.com'}
      expect(app.send(:pest?, env)).to be true
    end

    it "should block videos-for-your-business.com" do
      env = {'HTTP_REFERER' => 'http://videos-for-your-business.com/'}
      expect(app.send(:pest?, env)).to be true
    end

    it "should block semaltmedia.com" do
      env = {'HTTP_REFERER' => 'http://semaltmedia.com/'}
      expect(app.send(:pest?, env)).to be true
    end

    it "should block video--production.com" do
      env = {'HTTP_REFERER' => 'http://video--production.com/'}
      expect(app.send(:pest?, env)).to be true
    end

    it "should block justprofit.xyz" do
      env = {'HTTP_REFERER' => 'http://justprofit.xyz/'}
      expect(app.send(:pest?, env)).to be true
    end

    it "should block phatvids.com" do
      env = {'HTTP_REFERER' => 'http://phatvidz.com/'}
      expect(app.send(:pest?, env)).to be true
    end

    it "should block free-video-tool.com" do
      env = {'HTTP_REFERER' => 'https://free-video-tool.com/'}
      expect(app.send(:pest?, env)).to be true
    end

    it "should block 1-free-share-buttons.com" do
      env = {'HTTP_REFERER' => '1-free-share-buttons.com/'}
      expect(app.send(:pest?, env)).to be true
    end
  end
end
