module StreakAPI
  # Wrapper for the StreakAPI REST API
  #
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include StreakAPI::Client::Users
  end
end
