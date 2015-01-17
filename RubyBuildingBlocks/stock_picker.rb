def stock_picker(prices)
	bestStart = 0
	bestFinish = prices.length
	bestProfit = 0
	for start in 0..prices.length-1
		for finish in start..prices.length-1
			tempProfit = prices[finish] - prices[start]
			if tempProfit > bestProfit
				bestStart = start
				bestFinish = finish
				bestProfit = tempProfit
			end
		end 
	end
	puts [bestStart, bestFinish].inspect
end

stock_picker([17,3,6,9,15,8,6,1,10])