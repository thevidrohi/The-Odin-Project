class Board

	attr_accessor :matrix
	
	def initialize
		@matrix = Array.new(3) do |c|
			Array.new(3){ |r| ' ' }	
		end
	end

	#returns gameOver
	def update(player)
		puts '#{player.name}, what\'s your move? (c, then r)'
		newColumn = Kernel.chomp
		newRow = Kernel.chomp

		@matrix[newColumn][newRow] = player.token

		gameOver = @matrix[newColumn].all?(player.token) | 
					[@matrix[1][newRow], @matrix[2][newRow], @matrix[3][newRow]].all?(player.token)
		
		unless gameOver
			gameOver = [@matrix[1][1], @matrix[2][2], @matrix[3][3]].all?(player.token) |
						[@matrix[1][3], @matrix[2][2], @matrix[3][1]].all?(player.token)
		end

		return gameOver
	end

	def show
		puts "The current board:"
		pp @matrix
	end
end