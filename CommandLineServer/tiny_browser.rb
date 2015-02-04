require 'socket'
require 'json'

def connect(hostname, port, request)
	socket = TCPSocket.open(hostname, port)
	socket.print(request)
	socket.close

	socket = TCPSocket.open(hostname, port)
	response = socket.gets.split("\n")
	puts response
	header = response[0].split(" ")
	case header[1].to_i
	when 200
		content = response[2..-1].join("\n")
		puts content + "\n"
	when 404
		puts "Error #{header[1]} #{header[2..-1].join(" ")}\n"
	else
		puts "Not a clue what to do with this"
	end
end


hostname = 'localhost'
port = 2000
path1 = "/index.html"
path3 = "/thanks.html"
request1 = "GET #{path1} HTTP/1.0\r\n\r\n"

#testing 404
#request2 = "GET #{path2} HTTP/1.0\r\n\r\n"
#connect(hostname, port, request2)

#request3 = "POST #{path2} HTTP/1.0\r\n\r\n"
#connect(hostname, port, request2)

puts "What kind of request do you wish to send?"
type = gets.chomp[0].downcase
case type
	when "g"
		connect(hostname, port, request1)
	when "p"
		puts "What's your name?"
		#name = gets.chomp
		name = "rahul"
		puts name

		puts "What's your email?"
		#email = gets.chomp
		email = "rahul@rahul.com"
		puts email

		hashOut = { viking: {name: name, email: email} }.to_json
		request3 = "POST #{path3} HTTP/1.0\r\n\r\nContent-Length: #{hashOut.size}\n#{hashOut}"
		connect(hostname, port, request3)
	else
		puts "Not found"
end
