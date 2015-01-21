class User
	@@tokens = ['X', 'O']
	attr_accessor :name, :token
	def initialize(name)
		@name = name
		@token = @@tokens.shuffle!.pop
	end
end