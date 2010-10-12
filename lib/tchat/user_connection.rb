require 'socket'

module TChat

  class UserConnection

    attr_accessor :user, :socket

    def initialize(user, users_manager, socket)
      @user = user
      @users_manager = users_manager
      @socket = socket
    end

    def start

        # The thread that handles a single client
        Thread.start(@socket) do |socket|

          loop {

            client_line = socket.gets
            client.puts "echo: " + client_line 

          }

        end

    end

  end #class UserConnection

end #module TChat

