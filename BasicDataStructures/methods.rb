# def build_tree(arr)
# 	#assume array is sorted
# 	parent = Node.new(arr[0])
# 	arr[1..-1].each do |el|
# 		if el > parent.value

# 			node = Node.new(el)
# 			parent.rchild = node
# 			node.parent = parent
# 		else
# 	end
# end

def build_tree(currArr, currNode=nil)
	root = nil
	unless currArr.empty?
		if currNode != nil
			parent = currNode.parent
			if currNode > parent
				if !parent.hasRightChild?
					parent.rchild = currNode
					build_tree(currArr[1..-1], Node.new(currArr[1], parent))
				else
					currNode.parent = parent.rchild
					build_tree(currArr, currNode)
				end
			else
				if !parent.hasLeftChild?
					parent.lchild = currNode
					build_tree(currArr[1..-1], Node.new(currArr[1], parent))
				else
					currNode.parent = parent.lchild
					build_tree(currArr, currNode)
				end
			end
		else
			root = Node.new(currArr[0])
			build_tree(currArr[1..-1], Node.new(currArr[1], root))
			return root;
		end
	else
		puts "You're done"
	end
end