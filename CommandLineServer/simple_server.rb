require 'socket'
require 'json'
require 'erb'

port = 2000
server = TCPServer.open(port)

loop do |variable|
	socket = server.accept #returns the socket
	puts "Client connected"
	
	rawInput = socket.read.split("\n")
	socket = server.accept #reopen connection

	header = rawInput[0]
	verb, path, version = header.split(" ", 3)
	statusCode = 200
	message = "OK"

	if verb.downcase.match(/^g*+$/)
		path = "." + path
		if !File.exists?(path)
			statusCode = 404
			message = "File not found"
			f = ""
		else
			f = File.read(path)
		end
		output = "#{version} #{statusCode} #{message}\nContent-length: #{f.length}\n#{f}\n\n"
		puts "\nSent over socket:" + output + "\n"
		socket.puts(output)
	elsif verb.downcase.match(/^p.+$/)
		#puts "POST requested"
		data = rawInput[1..-1].join("\n").match(/^Cont.+$/m).to_s.split("\n")[1]
		params = JSON.parse(data)
		puts params

		template = File.read("thanks.html")
		erbOutput = ERB.new template
		htmlOutput = erbOutput.result(binding)
		puts htmlOutput
		socket.puts(version + " 200 You're good\n" + htmlOutput)
	else
		socket.puts("No idea what you're going for here.")
	end

	socket.puts("Closing connection.")
	socket.close
end