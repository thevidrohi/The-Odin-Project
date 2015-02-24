require 'yaml'

class Board
	attr_accessor :matrix
	#remember to align the indices...0=8, 1=7, and so on...
	#same for columns: need to convert to letters

	def initialize
		#check first whether loading or creating anew
		@matrix = Array.new(8){ Array.new(8) }
		@matrix[0][0] = Rook.new("black")
		@matrix[0][1] = Knight.new("black")
		@matrix[0][2] = Bishop.new("black")
		@matrix[0][3] = King.new("black")
		@matrix[0][4] = Queen.new("black")
		@matrix[0][5] = Bishop.new("black")
		@matrix[0][6] = Knight.new("black")
		@matrix[0][7] = Rook.new("black")

		8.times{ |i| @matrix[1][i] = Pawn.new("black") }

		@matrix[7][0] = Rook.new("white")
		@matrix[7][1] = Knight.new("white")
		@matrix[7][2] = Bishop.new("white")
		@matrix[7][3] = King.new("white")
		@matrix[7][4] = Queen.new("white")
		@matrix[7][5] = Bishop.new("white")
		@matrix[7][6] = Knight.new("white")
		@matrix[7][7] = Rook.new("white")

		8.times{ |i| @matrix[6][i] = Pawn.new("white") }
	end

	def isEmpty?(r, c)
		@matrix[r][c] == nil
	end

	def save
	end

	def convert_raw_to_index(row, col)
		#0,0 to a8
		ind2 = 8-row.to_i
		ind1 = ''
		case col.to_i
			when 0 #not the most elegant, I know, but didn't want to deal with characters
		 		ind1 = 'a'
		 	when 1
		 		ind1 = 'b'
		 	when 2
		 		ind1 = 'c'
		 	when 3
		 		ind1 = 'd'
		 	when 4
		 		ind1 = 'e'
		 	when 5
		 		ind1 = 'f'
		 	when 6
		 		ind1 = 'g'
		 	when 7
		 		ind1 = 'h'
		 end
		"#{ind1}#{ind2}"
	end

	def convert_index_to_raw(ind)
		#a8 to 0,0
		ind = ind.to_s
		if ind.match(/[a-h]/)
		 	case ind
		 	when 'a' #not the most elegant, I know, but didn't want to deal with characters
		 		0
		 	when 'b'
		 		1
		 	when 'c'
		 		2
		 	when 'd'
		 		3
		 	when 'e'
		 		4
		 	when 'f'
		 		5
		 	when 'g'
		 		6
		 	when 'h'
		 		7
		 	end
		else
			8 - ind.to_i
		end
	end

	def move_piece(start, finish)
		cstart = convert_index_to_raw(start[0])
		rstart = convert_index_to_raw(start[1])
		cfinish = convert_index_to_raw(finish[0])
		rfinish = convert_index_to_raw(finish[1])

		if isEmpty?(rstart, cstart)
			puts "No piece there, foo. Try again."
		else
			piece = @matrix[rstart][cstart]
			unless piece.possible_moves([rstart, cstart]).include?([rfinish, cfinish])
				puts "Can't move there, foo. Try again."
			else
				if isEmpty?(rfinish, cfinish)
					update(piece, rstart, cstart, rfinish, cfinish)
				else
					otherPiece = @matrix[rfinish][cfinish]
					if piece.onSameTeam?(otherPiece)
						puts "That's your own piece there, foo. Try again."
					else
						update(piece, rstart, cstart, rfinish, cfinish)
					end
				end
			end
		end
		show
	end

	def update(piece, rstart, cstart, rfinish, cfinish)
		puts "**#{piece.class.to_s.upcase} to #{convert_raw_to_index(rfinish, cfinish)}**"
		@matrix[rfinish][cfinish] = @matrix[rstart][cstart]
		@matrix[rstart][cstart] = nil
	end

	def show
		puts "\nGAME BOARD:\n   -----------------------------------------"
		@matrix.each_with_index do |row, rind| 
			print "#{(8-rind).to_s} "
			@matrix.each_with_index do |col, cind|
				if isEmpty?(rind, cind) #modify later to make more user friendly, maybe
					print " |   "
				else
					print " | " + @matrix[rind][cind].to_s + " "
				end
			end
			puts " |\n   -----------------------------------------"
		end
		puts "     #{'a'}    #{'b'}    #{'c'}    #{'d'}    #{'e'}    #{'f'}    #{'g'}    #{'h'}"
		puts "\n"
	end
end