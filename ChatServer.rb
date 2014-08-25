require 'socket'
require 'thread'             

server = TCPServer.open(1500)
puts "Server initiated."
@clientGroup = Array.new
@usernameGroup = Array.new

loop do                      
	Thread.start(server.accept) do |client|
		#puts(defined? client)
		def postOthers (aMessage)
			for thatClient in @clientGroup
				thatClient.puts(aMessage) unless thatClient == client
			end
		end

		def displayUsers
			client.puts("The following users are logged on:")
			for name in @usernameGroup
				client.puts(name)
			end
		end


		client.puts("Enter username:")
		username = client.gets.chop
		@clientGroup.push(client)
		@usernameGroup.push(username)

		puts("New user (#{username}).")
		client.puts("Welcome, #{username}.")
		displayUsers
		postOthers("#{username} logged on.")

		loop do
			puts ("made it to loop")
			message = client.gets.chop
			if (message == "logout")
				postOthers("#{username} logged off.")
				break
			elsif (message == "users")
				displayUsers
			else
				postOthers("#{username}: #{message}")
			end
		end
	
	client.close
	@clientGroup.delete(client)
	@usernameGroup.delete(username)
	puts "User disconnected (#{username})."
	end
end
