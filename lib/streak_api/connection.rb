require 'faraday_middleware'

module StreakAPI
  # @private
  module Connection
    private

    def connection(raw=false)
      options = {
        :headers => {'Accept' => "application/json; charset=utf-8", 'User-Agent' => user_agent},
        :ssl => {:verify => false},
        :url => endpoint,
      }

      Faraday::Connection.new(options) do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Request::BasicAuthentication, access_token, 'ignored'
        connection.use FaradayMiddleware::Mashify
        connection.use Faraday::Response::ParseJson
        connection.adapter(adapter)
      end
    end
  end
end
