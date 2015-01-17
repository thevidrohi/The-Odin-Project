def substrings(words, dictionary)
	#wordArr = words.downcase.split(/\W/)
	hashOut = Hash.new()
	dictionary.each do |word|
		wordArr = words.downcase.scan(/#{word}/)
		numTimes = wordArr.length
		hashOut[word] = numTimes if numTimes > 0
	end
	p hashOut
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)