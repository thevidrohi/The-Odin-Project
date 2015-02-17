require './node'
require './methods'

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

rootNode = build_tree(arr);
puts rootNode.print_tree
puts rootNode
puts breadth_first_search(67, [rootNode])