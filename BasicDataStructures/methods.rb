def build_tree(currArr, currNode=nil, root=nil)
	unless currArr.empty?
		if currNode != nil
			parent = currNode.parent
			if currNode > parent
				if !parent.hasRightChild?
					parent.rchild = currNode
					build_tree(currArr[1..-1], Node.new(currArr[1], root), root)
				else
					currNode.parent = parent.rchild
					build_tree(currArr, currNode, root)
				end
			else
				if !parent.hasLeftChild?
					parent.lchild = currNode
					build_tree(currArr[1..-1], Node.new(currArr[1], root), root)
				else
					currNode.parent = parent.lchild
					build_tree(currArr, currNode, root)
				end
			end
		else
			root = Node.new(currArr[0])
			build_tree(currArr[1..-1], Node.new(currArr[1], root), root)
			return root;
		end
	else
		puts "You're done"
	end
end

def breadth_first_search(targetVal, queue)
	while queue != nil
		newQueue = []
		queue.each do |nodeEl|
			if nodeEl.value == targetVal
				return nodeEl
			else
				if nodeEl.hasLeftChild?
					newQueue << nodeEl.lchild
				end
				if nodeEl.hasRightChild?
					newQueue << nodeEl.rchild
				end
			end
		end
		queue = newQueue
	end
end