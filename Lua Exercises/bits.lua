function hamming_weight(number)
	local one_count = 0
	
	while number ~= 0
	do
		if number & 1 == 1
		then
			one_count = one_count + 1
		end
		
		number = number >> 1
	end
	
	return one_count
end