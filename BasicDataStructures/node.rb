class Node
	include Comparable

	attr_accessor :value, :parent, :lchild, :rchild
	def initialize(value, parent=nil, lchild=nil, rchild=nil)
		@value = value
		@parent = parent
		@lchild = lchild
		@rchild = rchild
	end

	def <=>(node)
		val = node.value
		out = nil
		if @value > val
			out = 1
		elsif @value < val
			out = -1
		else
			out = 0
		end
		out
	end

	def hasRightChild?
		@rchild.exist?
	end

	def hasLeftChild?
		@lchild.exist?
	end

	def to_s
		puts @value
	end
end