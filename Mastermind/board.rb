class Board
	attr_accessor :code
	@@colors = ['red', 'orange', 'yellow', 'green', 'blue', 'violet']
	@@size = 4
	def initialize
		@code = Array.new(@@size)
	end

	def self.colors
		@@colors
	end

	def self.size
		@@size
	end
end