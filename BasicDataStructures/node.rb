class Node
	include Comparable

	attr_accessor :value, :parent, :lchild, :rchild
	def initialize(value, parent=nil, lchild=nil, rchild=nil)
		@value = value.to_i
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
		@rchild != nil
	end

	def hasLeftChild?
		@lchild != nil
	end

	def to_s
		puts "Value: #{@value}"
		if hasLeftChild?
			puts "Left Child: #{lchild.value}"
		else
			puts "No Left Child"
		end
		if hasRightChild?
			puts "Right Child: #{rchild.value}"
		else
			puts "No Right Child"
		end
	end

	def print_tree()
		#kind of mangled, but gets the job done
		out = "-----" + @value.to_s + "-----"
		if hasLeftChild?
			out = out + "\nL of #{lchild.parent.value.to_s}" + @lchild.print_tree
		end
		if hasRightChild?
			out = out + "\nR of #{rchild.parent.value.to_s}-----" + @rchild.print_tree
		end
		out
	end
end