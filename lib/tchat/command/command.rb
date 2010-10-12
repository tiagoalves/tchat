module TChat
  module Command

    class Command

      attr_accessor :command, :description

      def initialize(command, description)
          @command = command
          @description = description
      end

      def execute
      end

    end # class Command

  end # module Command
end # module TChat
