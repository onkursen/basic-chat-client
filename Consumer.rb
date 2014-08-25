# Onkur Sen
# Dr. Samadazeh
# Parallel and Distributed Computing
# Consumer
# September 15, 2009

require 'socket'

s = TCPSocket.open('localhost', 1337)

loop {
	s.puts("Request")
	response = s.gets
	if response.chop()=="quit"
		break
	else
		puts(response)
	end
}

s.close
