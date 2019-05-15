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

function markov_chain()
	function allwords()
		local line = io.read()
		local position = 1
		
		return function()
			while line ~= nil
			do
				local word, end_index = string.match(line, "(%w+[,;.:]?()", position)
				
				if word ~= nil
				then
					position = end_index
					
					return word
				else
					line = io.read()
					position = 1
				end
			end
			
			return nil
		end
	end

	function prefix(word1, word2)
		return w1 .. " " .. w2
	end

	local statetab = { }

	function insert(prefix, value)
		local list = statetab[prefix]
		
		if list == nil
		then
			statetab[prefix] = { value }
		else
			list[#list + 1] = value
		end
	end

	local MAX_GEN = 200
	local NO_WORD = "\n"

	local word1, word2 = NO_WORD, NO_WORD

	for next_word in allwords()
	do
		insert(prefix(word1, word2), NO_WORD)
		word1 = word2
		word2 = next_word
	end

	insert(prefix(word1, word2), NO_WORD)

	word1 = NO_WORD
	word2 = NO_WORD

	for i = 1, MAX_GEN
	do
		local list = statetab[prefix(word1, word2)]
		local random_item = math.random(#list)
		local next_word = list[random_item]
		
		if next_word == NO_WORD
		then
			return
		end
		
		io.write(next_word, " ")
		
		word1 = word2
		word2 = next_word
	end
end