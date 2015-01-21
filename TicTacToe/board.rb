class Board

	attr_accessor :matrix
	
	def initialize
		@matrix = Array.new(3) do |c|
			Array.new(3){ |r| '_' }	
		end
	end

	#returns gameOver
	def update(player)
		puts player.name + ' what\'s your move? (r, then c)'
		newColumn = gets.chomp.to_i - 1 #note all of the rows and column var names are backwards...
		newRow = gets.chomp.to_i - 1

		@matrix[newColumn][newRow] = player.token

		gameOver = @matrix[newColumn].all? { |el| el == player.token } | 
					[@matrix[0][newRow], @matrix[1][newRow], @matrix[2][newRow]].all? { |el| el == player.token }
		
		unless gameOver
			gameOver = [@matrix[0][0], @matrix[1][1], @matrix[2][2]].all? { |el| el == player.token } |
						[@matrix[0][2], @matrix[1][1], @matrix[2][0]].all? { |el| el == player.token }
		end

		return gameOver
	end

	def show
		puts "The current board:"
		@matrix.each do |row|
			puts row.join(' ')
		end
	end
end