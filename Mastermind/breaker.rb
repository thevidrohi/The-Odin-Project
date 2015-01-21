class Breaker < Player
	attr_accessor :name

	def initialize(name, isHuman, board)
		super(name, isHuman, board)
	end

	def move
		unless isHuman
			puts "What is your guess, " + self.name + "?"
			guess = Array.new(Board::size)
			Board::size.times { |index| guess[index] = gets.chomp }
			puts "Okay, checking your guess of #{guess.inspect}..."
			return guess
		else
			#input commputer AI options
		end
	end
end