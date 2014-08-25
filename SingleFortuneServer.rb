# Onkur Sen
# Dr. Samadazeh
# Parallel and Distributed Computing
# Single Fortune Server
# September 15, 2009

require 'socket'

server = TCPServer.open(1993)
puts "Server initiated."

fortunes = [
	"The stars favor you; you will be successful in your every endeavor.",
	"You will pass all of your exams.",
	"You will have the greatest luck today."
]

loop {
	puts "Waiting for client."
	client = server.accept
	puts "New client accepted."
	connected = true
	until connected == false do
		command = client.gets
		if command.chop()=="exit" || command.chop()=="quit" then
			connected=false
		else
			puts "Sending fortune to client."
			client.puts(fortunes[rand(fortunes.length)])
		end
	end
	client.close
	puts "Client disconnected."
}
