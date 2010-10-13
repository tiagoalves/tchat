module TChat
  module Command

    class CommandsManager

      def initialize(types = [:handshake])
        self.types = types
        self.commands = {}
      end


      # The commands are loaded automagically from the disk
      # The path that is scanned is lib/tchat/command/<type>/*.rb
      def load_commands
        self.types.each { |type|
          cmds = Dir.glob(File.join("lib", "tchat", "command", type.to_s, "*.rb"))
          # Require each file
          cmds.each { |cmd| require cmd }
          # Gets just the file name
          cmds.map! { |cmd| cmd[cmd.rindex(File::SEPARATOR) + 1..cmd.rindex('.') - 1] }
          # under_score to CamelCase
          cmds.map! { |cmd| cmd.split(/_/).map { |w| w.capitalize }.join('') }
          cmds.map! { |cmd| Kernel.const_get("TChat").const_get("Command").const_get(cmd) }

          add_commands_to_type cmds, type
        }
      end

      def get_commands_by_type(type)
        commands[type] ? commands[type].values : nil
      end

      # Get a command by its type and its command string
      # Ex: get_command :handshake, 'register'
      def get_command(type, command)
        commands[type] ? commands[type][command] : nil
      end

      def types
        @types
      end

    private

      def commands
        @commands
      end

      def commands=(commands)
        @commands = commands
      end

      def types=(types)
        @types = types
      end

      # Add each command to its type hash indexed by its command string
      # Ex: [:handshake => ["register" => TChat::Command::RegisterCommand, "signin" => ...::SigninCommand ]]
      def add_commands_to_type(cmds, type)
        commands[type] ||= {}
        cmds.each { |cmd|
          commands[type][cmd.command] = cmd
        }
      end

    end # class CommandsManager

  end # module Command
end # module TChat

