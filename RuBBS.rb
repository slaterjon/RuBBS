###################################
# RuB.B.S
# Light weight cross platform BBS software that from the start is ment to be used with telnet
###################################

require 'socket'

main = File.exists?("main.txt")
userf = File.exists?("users.txt")

if main == false
	puts "You are missing the main.txt file. Please recreate this file and try again"
	exit
end

if userf == false
	puts "You are missing your users.txt file.  Please create one and try again"
	exit
end

main = File.read("main.txt")
#userf = File.read("users.txt")
e=0

#def start
	server = TCPServer.open(23)	
	puts("Server started")
	loop  {
		Thread.start(server.accept) do |client|
			time1 = Time.new
			puts"New Client connected : " + time1.inspect	
			#client.puts"this is a test"
			#client.puts"this ends the tests, thank you"
			loop{			
				client.puts(main)				
				client.print"=>"
				client_prompt = client.gets.chomp()			
					if client_prompt == "5"
						client.close
						time2 = Time.new
						puts"Client Disconnected : " + time2.inspect
					elsif client_prompt == "1"
						client.puts(client_prompt)
					elsif client_prompt == "2"
						client.puts(client_prompt)
					elsif client_prompt == "3"
						client.puts(client_prompt)
					elsif client_prompt == "4"
						client.puts(client_prompt)
					else
						client.puts"Please use one of the options"
					end
			}
			client.close
			time2 = Time.new
			puts"Client Disconnected : " + time2.inspect
		end
	}
#end

def stop
	TCPServer.close(23)
	puts("Server stopped")
end

def reset
	
end

#def server_menu
	#prompt = '=>'	
	#puts "S <= To start the Server"
	#puts "H <= To stop/halt the Server"
	#puts "R <= To restart the Server"
	#puts "E <= To exit"
	#print prompt
	#status = STDIN.gets.chomp()
#end

#while e < 1 do
#	server_menu	
#	if status == "S"
#		start		
#		puts "start server"
#		server_menu
#	elsif status == "H"
#		stop
#	elsif status == "R"
#		reset
#	elsif status == "E"
#		e=1
#	else
#		puts "You did not enter a letter I recognize"
#	end
#end
