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

    path = File.expand_path('../urls.txt', __FILE__)
    File.open(path) do |fh|
      fh.each_line do |url|
        it "should block #{url.chomp}" do
          env = {'HTTP_REFERER' => url.chomp}
          expect(app.send(:pest?, env)).to be true
        end

        it "should block http://#{url.chomp}" do
          env = {'HTTP_REFERER' => url.chomp}
          expect(app.send(:pest?, env)).to be true
        end

        it "should block https://#{url.chomp}" do
          env = {'HTTP_REFERER' => url.chomp}
          expect(app.send(:pest?, env)).to be true
        end
      end
    end
  end
end
