require './user.rb'
require './board.rb'

gameOver = false
winningPlayer = nil
playerOneTurn = true

puts 'Welcome to Tic Tac Toe from RTech!'
puts 'Please enter the name of player 1:'
name1 = gets.chomp
puts 'Please enter the name of player 2:'
name2 = gets.chomp

player1 = User.new(name1)
player2 = User.new(name2)
board = Board.new

until gameOver do
	playerOneTurn = true
	board.show	
	gameOver = board.update(player1)
	board.show
	unless gameOver
		playerOneTurn = false
		gameOver = board.update(player2)
	end
end
playerOneTurn ? winningPlayer = player1 : winningPlayer = player2
puts winningPlayer.name + ' wins! Hope you had fun. Bye now.'