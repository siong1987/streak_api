require File.expand_path('../spec_helper', __FILE__)

describe StreakAPI do
  after do
    StreakAPI.reset
  end

  describe ".client" do
    it "should be a StreakAPI::Client" do
      StreakAPI.client.should be_a StreakAPI::Client
    end
  end

  describe ".adapter" do
    it "should return the default adapter" do
      StreakAPI.adapter.should == StreakAPI::Configuration::DEFAULT_ADAPTER
    end
  end

  describe ".adapter=" do
    it "should set the adapter" do
      StreakAPI.adapter = :typhoeus
      StreakAPI.adapter.should == :typhoeus
    end
  end

  describe ".endpoint" do
    it "should return the default endpoint" do
      StreakAPI.endpoint.should == StreakAPI::Configuration::DEFAULT_ENDPOINT
    end
  end

  describe ".endpoint=" do
    it "should set the endpoint" do
      StreakAPI.endpoint = 'http://tumblr.com'
      StreakAPI.endpoint.should == 'http://tumblr.com'
    end
  end

  describe ".user_agent" do
    it "should return the default user agent" do
      StreakAPI.user_agent.should == StreakAPI::Configuration::DEFAULT_USER_AGENT
    end
  end

  describe ".user_agent=" do
    it "should set the user_agent" do
      StreakAPI.user_agent = 'Custom User Agent'
      StreakAPI.user_agent.should == 'Custom User Agent'
    end
  end

  describe ".configure" do

    StreakAPI::Configuration::VALID_OPTIONS_KEYS.each do |key|

      it "should set the #{key}" do
        StreakAPI.configure do |config|
          config.send("#{key}=", key)
          StreakAPI.send(key).should == key
        end
      end
    end
  end
end
