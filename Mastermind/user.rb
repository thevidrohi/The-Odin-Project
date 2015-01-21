class Player
	require './board'
	attr_accessor :name, :isHuman, :history
	def initialize(name, isHuman, board)
		@name = name
		@isHuman = isHuman
	end

	def move

	end
end