begin
  require 'simplecov'
rescue LoadError
  # ignore
else
  SimpleCov.start do
    add_group 'StreakAPI', 'lib/streak_api'
    add_group 'Specs', 'spec'
  end
end
require File.expand_path('../../lib/streak_api', __FILE__)

require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include WebMock::API
end

def a_delete(path, basic_auth=nil)
  a_request(:delete, make_url(path, basic_auth))
end

def a_get(path, basic_auth=nil)
  a_request(:get, make_url(path, basic_auth))
end

def a_post(path, basic_auth=nil)
  a_request(:post, make_url(path, basic_auth))
end

def a_put(path, basic_auth=nil)
  a_request(:put, make_url(path, basic_auth))
end

def stub_delete(path, basic_auth=nil)
  stub_request(:delete, make_url(path, basic_auth))
end

def stub_get(path, basic_auth=nil)
  stub_request(:get, make_url(path, basic_auth))
end

def stub_post(path, basic_auth=nil)
  stub_request(:post, make_url(path, basic_auth))
end

def stub_put(path, basic_auth=nil)
  stub_request(:put, make_url(path, basic_auth))
end

def make_url(path, basic_auth)
  if basic_auth
    StreakAPI.endpoint.gsub('https://', "https://#{basic_auth}:ignored@") + path
  else
    StreakAPI.endpoint + path
  end
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
