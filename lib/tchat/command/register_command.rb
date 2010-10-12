require 'lib/tchat/command/command.rb'
require 'lib/tchat/user.rb'

module TChat
  module Command
  
    class RegisterCommand < Command

      def initialize(args, users_manager, socket)
        super "register", "Registers a new User with the system. Username: #{args[0]} Password: #{args[1]}"

        @email = args[0]
        @password = args[1]
        @name = args[2]

        @users_manager = users_manager
        @socket = socket
      end

      def execute
        # Try performing the user registration
        existing = @users_manager.email_registered? @email
        if (existing)
          # The email address is already in use.
          @socket.puts "The provided e-mail address is already in use. Please log in or use another e-mail address."
          @socket.close
          return
        end

        user = User.new(@email, @password, @name)
        @users_manager.user_register user
        @users_manager.user_signin user

        # Hand the socket to the UserConnection who will
        # be responsible for the user during his session
        user_connection = UserConnection.new user, @users_manager, @socket
        user_connection.start

        @socket.puts "Successfully registered. You are now logged in."

      end


    end # class RegisterCommand

  end # module Command
end # module TChat
