module StreakAPI
  class Client
    # Defines methods related to users
    module Users
      # Returns extended information of a given user
      #
      # @overload user(id=nil, options={})
      #   @return [Hashie::Mash] The requested user.
      def user(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        id = args.first || 'me'
        response = get("users/#{id}", options)
        response
      end
    end
  end
end
