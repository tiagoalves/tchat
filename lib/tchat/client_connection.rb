require 'socket'

module TChat

  class ClientConnection

    

    def initialize(user, socket)
      @user = user
      @socket = socket
    end

    def start

        # The thread that handles a single client
        Thread.start(server.accept) do |client|

          loop {
            client_line = client.gets

            client.puts "echo... " + client_line 
	          client.puts "Closing the connection. Bye!"
            client.close
          }
        end


    end

  end #class Server

end #module TChat

