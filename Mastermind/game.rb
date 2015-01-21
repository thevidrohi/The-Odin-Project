require './user'
require './board'
require './maker'
require './breaker'

gameOver = false

puts "Welcome to Mastermind by RTech!"
puts "What is your name?"
name = gets.chomp

tries = 12

gameBoard = Board.new
#need to fix the naming issue, but leaving for now
maker = Maker.new("Computer", true, gameBoard) #if isMaker
breaker = Breaker.new(name, false, gameBoard)

puts "for debugging, here's the actual code: #{gameBoard.code.inspect}"

until (gameOver || tries == 0) do
	puts "-------------------------------"
	guess = breaker.move
	feedback = maker.move(guess, gameBoard)
	if feedback.all? { |el| el == 'b' }
		gameOver = true
		break
	else
		puts "Incorrect. Here is your feedback: #{feedback.inspect}"
		tries -= 1
		puts "You have #{tries} tries remaining"
	end
end
#output = ""
gameOver ? output = "Congrats--the code has been broken! Bye now." : output = "Sorry, you ran out of tries. Bye now."
puts output