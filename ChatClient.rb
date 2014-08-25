require 'socket'
require 'thread'

socket = TCPSocket.open('localhost', 1500)

Thread.new do
	loop do
		socketMessage = socket.gets.chop
		puts(socketMessage)
	end
end

loop do
	message = gets.chop
	socket.puts(message) unless (message == nil)
	break if (message == "logout")
end

socket.close
puts("Disconnected from server.")
