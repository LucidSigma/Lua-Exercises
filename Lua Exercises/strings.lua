function insert(s, i, p)
	return string.sub(s, 0, i - 1) .. p .. string.sub(s, i)
end

function remove(s, i, j)
	return string.sub(s, 0, i - 1) .. string.sub(s, i + j)
end

function is_palindrome(s)
	if #s == 0 or #s == 1
	then
		return true
	end
	
	if string.sub(s, 1, 1) == s.sub(s, -1, -1)
	then
		return is_palindrome(string.sub(s, 2, -2))
	else
		return false
	end
end

function concat(s)
	local string = s[1]
	
	for i = 2, #s
	do
		string = string .. s[i]
	end
	
	return string
end

function split(s, d)
	local t = { }
	
	for str in string.gmatch(s, "([^" .. d .. "]+)")
	do
		table.insert(t, str)
	end
	
	return t
end

print(insert("hello", 6, " world"))
print(remove("hello world", 3, 7))

print(is_palindrome("acaramanamaraca"))
print(is_palindrome("not a palindrome"))

print(concat({ 'h', 'e', 'l', 'l', 'o' }))

words = split("these are a bunch of words", ' ')

for i = 1, #words
do
	io.write(words[i], " ")
end

io.write("\n")