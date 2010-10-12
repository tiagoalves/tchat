require 'lib/tchat/command/register_command.rb'
require 'lib/tchat/command/signin_command.rb'

module TChat
  module Command

    class IdentificationCommandFactory

      def initialize(users_manager)
        @users_manager = users_manager
      end

      def create_command(command_string, socket)
        command_args = command_string.split(' ')
        command_cmd = command_args.shift

        case command_cmd
        when "/register"
          cmd = RegisterCommand.new(command_args, @users_manager, socket)
        when "/signin"
          cmd = SigninCommand.new(command_args, @users_manager, socket)
        end

        return cmd

      end # create_command

    end # class CommandFactory
  
  end # module Command
end # module TChat
