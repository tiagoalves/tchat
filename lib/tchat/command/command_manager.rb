# This is not being used for now

module TChat
  module Command

    class CommandsManager

      attr_reader :commands

      def initialize
        @commands = []
      end

      def add_command(cmd)
        @commands[cmd.name] = cmd
      end

      def get_command(cmd_name)
        @commands[cmd_name]
      end

    end # class CommandsManager

  end # module Command
end # module TChat

