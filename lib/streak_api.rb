require File.expand_path('../streak_api/configuration', __FILE__)
require File.expand_path('../streak_api/api', __FILE__)
require File.expand_path('../streak_api/client', __FILE__)
require File.expand_path('../streak_api/response', __FILE__)

module StreakAPI
  extend Configuration

  # Alias for StreakAPI::Client.new
  #
  # @return [StreakAPI::Client]
  def self.client(options={})
    StreakAPI::Client.new(options)
  end

  # Delegate to StreakAPI::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to StreakAPI::Client
  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end
end
