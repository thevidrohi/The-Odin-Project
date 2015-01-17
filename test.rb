def gClock(&theProc)
	timeNow = Time.now.hour + 1;
	puts timeNow
	timeNow.times do
		theProc.call
	end
end

gClock	do
	puts 'DONG!'
end 
