require File.expand_path('../../spec_helper', __FILE__)

describe StreakAPI::API do
  before do
    @keys = StreakAPI::Configuration::VALID_OPTIONS_KEYS
  end

  context "with module configuration" do

    before do
      StreakAPI.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      StreakAPI.reset
    end

    it "should inherit module configuration" do
      api = StreakAPI::API.new
      @keys.each do |key|
        api.send(key).should == key
      end
    end

    context "with class configuration" do

      before do
        @configuration = {
          :access_token => 'AT',
          :adapter => :typhoeus,
          :endpoint => 'http://tumblr.com/',
          :user_agent => 'Custom User Agent'
        }
      end

      context "during initialization"

        it "should override module configuration" do
          api = StreakAPI::API.new(@configuration)
          @keys.each do |key|
            api.send(key).should == @configuration[key]
          end
        end

      context "after initilization" do

        it "should override module configuration after initialization" do
          api = StreakAPI::API.new
          @configuration.each do |key, value|
            api.send("#{key}=", value)
          end
          @keys.each do |key|
            api.send(key).should == @configuration[key]
          end
        end
      end
    end
  end
end
