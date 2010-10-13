module TChat
  module Command

    class HandshakeCommandFactory
      
      def initialize(commands_manager)
        self.commands_manager = commands_manager
      end

      def create_command(command_line, users_manager, socket)
        
        if !command_line.nil? && !command_line.strip.rstrip.empty?

          command_args = command_string.split(' ')
          # Get the user command such as /register and drop the leading /
          command_cmd = command_args.shift[1..-1]

          # Get the concrete command class that can handle the received command string
          command_class = self.commands_manager.get_command :handshake, command_cmd
          if !command_class.nil?
            command = command_class.new(command_args, users_manager, socket)
            return cmd
          end

        end

        raise "Invalid command"
      end

    private

      def commands_manager=(commands_manager)
        @commands_manager = commands_manager
      end

    end

  end
end
