require 'socket'
require './client_connection.rb'

module TChat

  class Server

    @users

    def initialize(port)
      @port = port
    end

    def start
      server = TCPServer.open(@port)

      loop {

        Thread.start(server.accept) do |client|
          client_line = client.gets
          client_args = client_line.split(' ')

          if (client_args.length < 3) {
            client.puts "Invalid sigin information provided..."
            client.close
            break
          }

          arg_command = client_args[0]
          arg_email = client_args[1]
          arg_password = client_args[2]

          client.puts "echo... " + client_line 
	        client.puts "Closing the connection. Bye!"
          client.close
        end

      }
    end

  end #class Server

end #module TChat

