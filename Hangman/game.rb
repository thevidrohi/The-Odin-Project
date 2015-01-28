require './hangman'
require 'yaml'

puts "**Welcome to HANGMAN!** by RTech"
puts "Load last game? Y/N"

answer = gets.chomp.downcase

#could use some refactoring, but it works

if answer == "y"
	game = YAML::load(File.read("savedGame.yaml"))
	puts "Welcome back."
	game.show
else
	numGuesses = 6
	dictionary = File.readlines("5desk.txt").collect{ |word| word.downcase.strip }
	word = dictionary[rand(dictionary.length)]
	game = Hangman.new(word, dictionary, numGuesses)
end

catch(:gameOver) do |variable|
	loop do
		puts "Please enter your guessed letter. If you'd like to save the game and exit instead, please enter SAVE."
		guess = gets.chomp
		if guess == "save"
			yaml = YAML::dump(game)
			File.open("savedGame.yaml", "w") { |f| f.puts yaml }
			throw(:gameOver)
		else
			matches = game.check(guess)
			if matches
				puts "Congrats! The word was #{word}"
				throw(:gameOver)
			elsif game.numGuesses == 0
				puts "Out of guesses. The word was #{word}. gg no re"
				throw(:gameOver)
			else
				#iterate on game
				game.show
			end
		end 
	end
end

puts "Goodbye."