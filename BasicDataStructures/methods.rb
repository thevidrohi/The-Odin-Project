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

def build_tree(currArr, parent=nil, left=nil, right=nil)
	if currParent.exist?
		node = Node.new(currArr[0], parent)
		if node > parent
			if parent.hasRightChild?
			build_tree(currArr, currParent.rchild)
		else
		end
	else
		root = Node.new(currArr[0])
		build_tree(currArr[1..-1], root)
	end
end