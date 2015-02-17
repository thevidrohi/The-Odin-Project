def knight_moves(first, last)
	#using BFS, since DFS could be infinite
	firstKnight = KnightNode.new(first)
	puts "First knight loc: #{firstKnight.location}"
	puts "Last loc: #{last}"
	queue = [firstKnight]
	newQueue = []
	lastChild = catch(:found) do
		loop do
			queue.each do |knightMove|
				puts knightMove
				if knightMove.location == last
					lastChild = knightMove
					throw(:found, lastChild)
				else
					knightMove.gen_children
					newQueue.concat(knightMove.children)
				end
			end
			queue = newQueue
			newQueue = []
		end
	end
	#once we have the last child, we need to bubble up to chart the path
	pathList = [lastChild.location]
	while(lastChild.parent != nil)
		pathList << lastChild.parent.location
		lastChild = lastChild.parent
	end
	puts "You made it in #{pathList.length-1} moves! Here's your path:"
	pathList.reverse.each{ |el| puts el.inspect }
end

class KnightNode
	attr_accessor :location, :children, :parent
	#children is an array of potential moves
	def initialize(loc, parent=nil)
		@location = loc
		@parent = parent
		@children = []
	end

	def addChild(childLoc)
		@children << KnightNode.new(childLoc, self)
	end

	def gen_children()
		#if any of the dimensions less than 0 or more than 7, exclude
		#0,0 = lower left corner
		#returns the array pair options
		row = @location[0]
		column = @location[1]
		optionNorthEast = [row+2, column+1]
		optionNorthWest = [row+2, column-1]

		optionSouthEast = [row-2, column+1]
		optionSouthWest = [row-2, column-1]

		optionEastNorth = [row+1, column+2]
		optionEastSouth = [row-1, column+2]

		optionWestNorth = [row+1, column-2]
		optionWestSouth = [row-1, column-2]

		options = [optionNorthEast, optionNorthWest, optionSouthEast, optionSouthWest, optionEastNorth, optionEastNorth, optionEastSouth, optionWestNorth, optionWestSouth]
		options.each do |option|
			row = option[0]
			column = option[1]
			#not outside the grid boundary
			if !(row > 7 || column > 7 || row < 0 || column < 0)
				addChild(option)
			end
		end
		options
	end
end