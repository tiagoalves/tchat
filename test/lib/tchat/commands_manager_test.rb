require 'test_helper'

class CommandsManagerTest < Test::Unit::TestCase
  include TChat

  def setup
    @type = :handshake
    @commands_manager = Command::CommandsManager.new
    assert_nothing_raised do
      @commands_manager.load_commands
    end
  end

  def test_types
    types = @commands_manager.types
    assert_not_nil types
    assert types.empty? == false
    assert types.include? @type
  end

  def test_get_commands_by_type
    cmds = @commands_manager.get_commands_by_type @type
    assert_not_nil cmds, "No commands registered for type #{@type}"
  end

  def test_get_command
    cmd = @commands_manager.get_command @type, 'register'
    assert_not_nil cmd
  end

end
