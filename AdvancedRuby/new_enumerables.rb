module Enumerable
	def my_each
		for i in 0..self.length-1
			el = self[i]
			yield(el) if block_given?
		end
		return to_enum(:my_each) unless block_given?
		self
	end

	def my_each_with_index
		for i in 0..self.length-1
			el = self[i]
			yield(el, i) if block_given?
		end
		return to_enum(:my_each_with_index) unless block_given?
		self
	end

	def my_all?
		return to_enum(:my_all?) unless block_given?
		for i in 0..self.length-1
			el = self[i]
			return false if yield(el) == false
		end
		true
	end
end

testArr = [1, 2, 3, 4, 5]
test1 = testArr.all? do |el|
	el < 6
end
puts test1
test2 = testArr.my_all? do |el|
	el < 6
end
puts test2