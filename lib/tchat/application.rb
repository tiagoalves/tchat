require 'lib/tchat/server.rb'
require 'lib/tchat/users_manager.rb'

module TChat

  class Application

    @users

    def initialize
    end

    def run
      users_manager = UsersManager.new
      server = Server.new 5000, users_manager
      server.start
    end

  end #class Application

end #module TChat
