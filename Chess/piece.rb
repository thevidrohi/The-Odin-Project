class Piece
	attr_accessor :team, :icon

	def initialize(team)
		@team = team #white or black
		@icon = "X"
	end

	def possible_moves(loc)
		#takes in raw index data of location [r c]
		#returns array of 1x2 arrays with row, col pairs
	end

	def isWhite?
		@team.eql?("white")
	end

	def onSameTeam?(otherPiece)
		@team.eql?(otherPiece.team)
	end

	def to_s
		@icon
	end
end

class Pawn < Piece
	def initialize(team)
		super(team)
		isWhite? ? @icon = "\u2659".encode('utf-8') : @icon = "\u265F".encode('utf-8')
	end

	def possible_moves(loc)
		# #pawn needs to check the board first for the diagonal move
		# if isWhite? #remember, moving diff directions
		# else
		# end
	end
end

class Rook < Piece
	def initialize(team)
		super(team)
		isWhite? ? @icon = "\u2656".encode('utf-8') : @icon = "\u265C".encode('utf-8')
	end
end

class Bishop < Piece
	#needs to check if anything is in its way for possible moves
	def initialize(team)
		super(team)
		isWhite? ? @icon = "\u2657".encode('utf-8') : @icon = "\u265D".encode('utf-8')
	end
end

class King < Piece
	def initialize (team)
		super(team)
		isWhite? ? @icon = "\u2654".encode('utf-8') : @icon = "\u265A".encode('utf-8')
	end
end

class Queen < Piece
	def initialize(team)
		super(team)
		isWhite? ? @icon = "\u2655".encode('utf-8') : @icon = "\u265B".encode('utf-8')
	end
end

class Knight < Piece
	def initialize(team)
		super(team)
		isWhite? ? @icon = "\u2658".encode('utf-8') : @icon = "\u265E".encode('utf-8')
	end

	def possible_moves(loc)
		row = loc[0]
		column = loc[1]

		optionNorthEast = [row+2, column+1]
		optionNorthWest = [row+2, column-1]

		optionSouthEast = [row-2, column+1]
		optionSouthWest = [row-2, column-1]

		optionEastNorth = [row+1, column+2]
		optionEastSouth = [row-1, column+2]

		optionWestNorth = [row+1, column-2]
		optionWestSouth = [row-1, column-2]

		options = [optionNorthEast, optionNorthWest, optionSouthEast, optionSouthWest, optionEastNorth, optionEastNorth, optionEastSouth, optionWestNorth, optionWestSouth]
		options.select do |option|
			row = option[0]
			column = option[1]
			#not outside the grid boundary
			!(row > 7 || column > 7 || row < 0 || column < 0)
		end
		options
	end
end