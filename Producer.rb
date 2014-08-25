# Onkur Sen
# Dr. Samadazeh
# Parallel and Distributed Computing
# Producer
# September 15, 2009

require 'socket'     
require 'thread'           

# don't try to reopen open port
server = TCPServer.open(1337)   
puts "Server initiated."
semaphore = Mutex.new

=begin
queue = Array.new(101)
for i in (1..100)	do
	queue[i-1]=i
end

top = 0;
=end

numClients=3
numberDone=0
num=0

for i in (1..numClients) do
	Thread.start(server.accept) do |client|
		id = i
		puts "New client accepted."
		loop do
			command = client.gets
			#if top == queue.length-1
			semaphore.synchronize do # Critical section
			   if num == 100
				   client.puts("quit")
				   client.close
				   puts("Client disconnected.")
				   numberDone+=1
			   else
				   num+=1
				   client.print(id,"-",num,"\n")
				end
			end
		end
	end
end

while numberDone<numClients
end

server.close
puts "Server terminated."
