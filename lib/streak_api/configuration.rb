require 'faraday'
require File.expand_path('../version', __FILE__)

module StreakAPI
  # Defines constants and methods related to configuration
  module Configuration
    # An array of valid keys in the options hash when configuring a {StreakAPI::API}
    VALID_OPTIONS_KEYS = [
      :adapter,
      :access_token,
      :endpoint,
      :user_agent
    ].freeze

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER = Faraday.default_adapter

    # By default, don't set a user access token
    DEFAULT_ACCESS_TOKEN = nil

    # The endpoint that will be used to connect if none is set
    #
    # @note There is no reason to use any other endpoint at this time
    DEFAULT_ENDPOINT = 'https://www.streak.com/api/v1/'.freeze

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "Streak Ruby Gem #{StreakAPI::VERSION}".freeze

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter        = DEFAULT_ADAPTER
      self.access_token   = DEFAULT_ACCESS_TOKEN
      self.endpoint       = DEFAULT_ENDPOINT
      self.user_agent     = DEFAULT_USER_AGENT
    end
  end
end
