require 'jumpstart_auth'

class MicroBlogger
	attr_reader :client

	def initialize
		#puts "Initializing MicroBlogger"
		@client = JumpstartAuth.twitter
	end

	def tweet(message)
		if message.length <= 140
			@client.update(message)
		else 
			puts "Sorry, your message was longer than 140 characters. Try again."
		end
	end

	def dm(target, message)
		usernames = followers_list
		unless !usernames.include?(target)
			if message.length <= 140
				@client.d(target, message)
			else 
				puts "Sorry, your message was longer than 140 characters. Try again."
			end
		else
			puts "Sorry, #{target} has to be following you before you can DM."
		end
	end

	def run
		puts "Welcome to the RTech Twitter Client."
		command = ""
		while command != "q"
			printf "enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			case command
				when "q"
					puts "Goodbye."	
				when "t"
					self.tweet(parts[1..-1].join(" "))
				when "dm"
					self.dm(parts[1], parts[2..-1].join(" "))
				when "spam"
					self.spam_my_followers(parts[1..-1].join(" "))
				when "elt"
					self.everyones_last_tweet
				else
					puts "Command #{t} does not compute."
			end
		end
	end

	def followers_list
		usernames = @client.followers.collect do |follower|
			@client.user(follower).screen_name
		end
		usernames
	end

	def spam_my_followers(message)
		followers_list.each do |follower|
			self.dm(follower, message)
		end
	end

	def everyones_last_tweet
		followees = @client.friends
		puts followees
		followees.each do |followee|
			sn = followee.screen_name
			puts "@#{sn}"
			puts "#{followee.status.text}"
			puts ""
		end
	end
end

blogger = MicroBlogger.new
blogger.run
#blogger.tweet("MicroBlogger Initialized!")
#blogger.tweet("".ljust(150, "abcd"))