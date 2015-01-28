class Hangman
	attr_accessor :word, :dictionary, :numGuesses, :status, :guessedLetters
	def initialize(word, dictionary, numGuesses)
		@word = word.downcase
		@dictionary = dictionary
		@numGuesses = numGuesses
		@status = word.gsub(/./,"_")
		#puts "Game Initialized!"
		#puts word
		#puts @status
		@guessedLetters = []
	end

	def check(guess)
		guess.downcase!
		#technically I should also check if it's a valid letter at all...icing
		if !@guessedLetters.include?(guess)
			@guessedLetters << guess

			matches = @word.include?(guess)
			isDone = false

			if matches
				index = @word.index(guess)
				while index && index < word.length
					@status[index] = guess
					index = @word.index(guess, index+1)
				end
				isDone = true if @status == @word
			else
				puts "That's incorrect"
				@numGuesses -= 1
			end
		else
			puts "You've already guessed that letter. Please try again."
		end
		
		isDone
	end

	def show
		puts @status
		puts @guessedLetters.join(", ")
		puts "You have #{@numGuesses} guesses remaining.\n"
	end
end