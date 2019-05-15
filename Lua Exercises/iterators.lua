function fromto(first, last)
	local function iterator(last, current)
		current = current + 1
		
		if current <= last
		then
			return current
		else
			return nil
		end
	end
	
	return iterator, last, first - 1
end

function all_unique_words()
	local line = io.read()
	local position = 1
	local word_cache = { }
	
	return function()
		while line ~= nil
		do
			local word, end_index = string.match(line, "(%w+)()", position)
			
			if word ~= nil
			then
				position = end_index
				
				if word_cache[word] == nil
				then
					word_cache[word] = word
					
					return word
				end
			else
				line = io.read()
				position = 1
			end
		end
		
		return nil
	end
end

for i in fromto(3, 9)
do
	print(i)
end

for w in all_unique_words()
do
	print(w)
end