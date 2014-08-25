# Onkur Sen
# Dr. Samadazeh
# Parallel and Distributed Computing
# Multiple Fortune Server
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
	Thread.start(server.accept) do |client|
		puts "New client accepted."
		connected = true
		until connected == false do
			command = client.gets
			if command.chop()=="exit" || command.chop()=="quit"
				connected=false
			else
				puts "Sending fortune to client."
				client.puts(fortunes[rand(fortunes.length)])
			end
		end
		client.close
		puts "Client disconnected."             
	end
}
