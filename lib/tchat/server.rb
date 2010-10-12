require 'socket'
require 'lib/tchat/users_manager.rb'
require 'lib/tchat/command/identification_command_factory.rb'

module TChat

  # :title:The class responsible for accepting new user connections
  # = Name
  # 
  # = Synopsis
  # 
  # = Description
  #
  # = Todo
  # == Upcoming Features
  # 0. Nothing yet.
  # == Known Issues
  # 0. Nothing yet.
  # = References
  # 0. <i>I made it up as I went along.</i>
  # = License
  # This code is provided under the terms of the {MIT License.}[http://www.opensource.org/licenses/mit-license.php]
  #
  #--
  # This code is the proprietary intellectual property of its authors.  It is not intended for publication.
  #++
  # = Authors
  # Tiago Alves
  #
  
  class Server

    attr_reader :users_manager, :port

    def initialize(port, users_manager)
      @port = port
      @users_manager = users_manager

      @factory = TChat::Command::IdentificationCommandFactory.new(@users_manager)
    end

    def start
      server = TCPServer.open(@port)

      puts "Starting to listen for connections on port " + @port.to_s

      loop {

        puts "Waiting for the next connections..."
        socket = server.accept
        identify_client socket

      }

    end # start


    private

    # At connection time we don't know yet what kind of client has arrived.
    # Before we hand the connection socket out to a certain handler, we
    # will receive and parse the first command
    def identify_client(socket)

      Thread.start(socket) do |socket|
        begin

          command = @factory.create_command socket.gets, socket
          command.execute unless command.nil?
          # At this point the user connection has been
          # handed to the respective handler or has been
          # dropped. Either way, it is no longer our business.

        rescue # Catch em all "à labrego"
          puts $!, $@
        end
      end # Thread.start

    end # handle_connection

  end # class Server

end # module TChat

