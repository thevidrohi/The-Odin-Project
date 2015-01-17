def caesar_cipher(inputStr, shiftnum)
	output = ""
	inputStr.scan(/./) do |c|
		nextChar = c.ord.+(shiftnum)
		if c.match(/\W/)
			output << c
		elsif nextChar.ord > "z".ord
			output << "a".ord + (shiftnum - ("z".ord - c.ord) - 1)
		elsif c.ord <= "Z".ord && nextChar.ord > "Z".ord
			output << "A".ord  + (shiftnum - ("Z".ord - c.ord) - 1)
		else
			output << nextChar
		end
	end
	puts output
end

caesar_cipher("What a string!", 5)