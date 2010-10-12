require 'lib/tchat/command/command.rb'
require 'lib/tchat/user_connection.rb'

module TChat
  module Command
  
    class SigninCommand < Command
      
      def initialize(args, users_manager, socket)
        super "signin", "Authenticates a registered User with the system. Email #{args[0]} Password #{args[1]}"
        @email = args[0]
        @password = args[1]
        @users_manager = users_manager
        @socket = socket
      end

      def execute
        user = @users_manager.get_user @email
        if (user == nil || user.password != @password)
          @socket.puts "The provided email or password is incorrect. Please try again."
          @socket.close
          return
        end

        # Valid credentials provided
        # Hand the socket to the UserConnection who will
        # be responsible for the user during his session.
        # Our work here is done...
        @users_manager.user_signin user
        user_connection = UserConnection.new user, @users_manager, @socket
        user_connection.start

        @socket.puts "Successfully logged in."

      end

    end # class RegisterCommand

  end # module Command
end # module TChat
