class Maker < Player
	def initialize(name, isHuman, board)
		super(name, isHuman, board)
		board.code = board.code.map { |el| Board.colors[rand(Board::colors.size)] } 
	end
	def move(guess, board)
		feedback = Array.new(Board.size)
		guess.each_with_index do |el, ind|
			if board.code[ind] == el
				feedback[ind] = 'b'
			elsif board.code.count(el) > feedback.count(el) #board.code.include?(el) && (
				feedback[ind] = 'w'
			else
				feedback[ind] = 'n'
			end
		end
		return feedback
	end
end