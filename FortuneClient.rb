# Onkur Sen
# Dr. Samadazeh
# Parallel and Distributed Computing
# Single Fortune Client
# September 15, 2009

require 'socket'

s = TCPSocket.open('localhost', 1993)

loop {
	puts "Enter a command"
	command = gets
	s.puts(command)
	if command.chop()=="exit" || command.chop()=="quit"
		break
	else
		puts(s.gets)
	end
}

s.close
puts("Disconnected from server.")
