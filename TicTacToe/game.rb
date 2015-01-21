require 'user'
require 'board'

gameOver = false
winningPlayer = nil

puts 'Welcome to Tic Tac Toe from RTech!'
puts 'Please enter the name of player 1:'
name1 = Kernel.chomp
puts 'Please enter the name of player 2:'
name2 = Kernel.chomp

player1 = User.new(name1)
player2 = User.new(name2)
board = Board.new

until gameOver do
	board.show	
	gameOver = board.update(player1, move)
	board.show
	unless gameOver
		gameOver = board.update(player2, move)
	end
end

puts '#{winningPlayer} wins! Hope you had fun. Bye now.'