function derivative(f)
	local DELTA = 1e-6
	
	return function(x)
		return (f(x + DELTA) - f(x)) / DELTA
	end
end

function curried_polynomial(p)
	return function (x)
		   	   local result = 0
		   	   		
		   	   for i = 1, #p
		   	   do
		   	   	   result = result + (p[i] * (x ^ (i - 1)))
		   	   end
		   	   
		   	   return result
		   end
end

function most_frequent_words(filename, n)
	local file = assert(io.open(filename, "r"))
	local counter = { }
	
	for line in file:lines()
	do
		for word in string.gmatch(string.lower(line), "%w+")
		do
			if #word > 3
			then
				counter[word] = (counter[word] or 0) + 1
			end
		end
	end
	
	file:close()
	
	local words = { }
	
	for w in pairs(counter)
	do
		words[#words + 1] = w
	end
	
	table.sort(words, function(word1, word2)
			return counter[word1] > counter[word2] or (counter[word1] == counter[word2] and word1 < word2)
		end)
	
	n = math.min(n or math.huge, #words)
	
	for i = 1, n
	do
		io.write(words[i], "\t", counter[words[i]], "\n")
	end
end