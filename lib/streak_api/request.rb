module StreakAPI
  # Defines HTTP request methods
  module Request
    # Perform an HTTP GET request
    def get(path, options={}, raw=false, unformatted=false, no_response_wrapper=false)
      request(:get, path, options, raw, unformatted, no_response_wrapper)
    end

    # Perform an HTTP POST request
    def post(path, options={}, raw=false, unformatted=false, no_response_wrapper=false)
      request(:post, path, options, raw, unformatted, no_response_wrapper)
    end

    # Perform an HTTP PUT request
    def put(path, options={}, raw=false, unformatted=false, no_response_wrapper=false)
      request(:put, path, options, raw, unformatted, no_response_wrapper)
    end

    # Perform an HTTP DELETE request
    def delete(path, options={}, raw=false, unformatted=false, no_response_wrapper=false)
      request(:delete, path, options, raw, unformatted, no_response_wrapper)
    end

    private

    # Perform an HTTP request
    def request(method, path, options, raw=false, unformatted=false, no_response_wrapper=false)
      response = connection(raw).send(method) do |request|
        case method
        when :get, :delete
          request.url(path, options)
        when :post, :put
          request.path = path
          request.body = options unless options.empty?
        end
      end
      return response if raw
      return response.body if no_response_wrapper
      return Response.create( response.body )
    end
  end
end
