require File.expand_path('../../../spec_helper', __FILE__)

describe StreakAPI::Client do
  context ".new" do
    before do
      @client = StreakAPI::Client.new(access_token: 'AT')
    end

    describe ".user" do

      context "with user key passed" do

        before do
          stub_get("users/def", @client.access_token).
            to_return(:body => fixture("jared.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end

        it "should get the correct resource" do
          @client.user("def")
          a_get("users/def", @client.access_token).should have_been_made
        end

        it "should return extended information of a given user" do
          user = @client.user('def')
          user.displayName.should == "Jared T"
        end

      end

      context "without user ID passed" do

        before do
          stub_get("users/me", @client.access_token).
            to_return(:body => fixture("siong.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end

        it "should get the correct resource" do
          @client.user()
          a_get("users/me", @client.access_token).should have_been_made
        end

        it "should return extended information of a given user" do
          user = @client.user("me")
          user.displayName.should == "Teng Siong O"
        end
      end
    end
  end
end

