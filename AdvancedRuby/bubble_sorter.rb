def bubble_sort(arr)
	doneSorting = false
	swapMade = false
	until doneSorting do
		arr[0..-2].each_index do |firstInd|
			firstEl = arr[firstInd]
			secondEl = arr[firstInd+1]
			if (firstEl<=>secondEl) > 0
		 		arr[firstInd] = secondEl
		 		arr[firstInd+1] = firstEl
		 		swapMade = true
		 	end
		end
		#p arr
		doneSorting = !swapMade
		swapMade = false
	end
	arr
end

def bubble_sort_by(arr)
	doneSorting = false
	swapMade = false
	until doneSorting do
		arr[0..-2].each_index do |firstInd|
			firstEl = arr[firstInd]
			secondEl = arr[firstInd+1]
			if yield(firstEl, secondEl) < 0
		 		arr[firstInd] = secondEl
		 		arr[firstInd+1] = firstEl
		 		swapMade = true
		 	end
		end
		doneSorting = !swapMade
		swapMade = false
	end
	arr
end