Set = { }
set_mt = { }

function Set.new(l)
	local set = { }
	setmetatable(set, set_mt)
	
	for _, v in ipairs(l)
	do
		set[v] = true
	end
	
	return set
end

function Set.union(a, b)
	local result = Set.new{ }
	
	for k in pairs(a)
	do
		result[k] = true
	end
	
	for k in pairs(b)
	do
		result[k] = true
	end
	
	return result
end

function Set.intersection(a, b)
	local result = Set.new{ }
	
	for k in pairs(a)
	do
		result[k] = b[k]
	end
	
	return result
end

function Set.difference(a, b)
	local result = Set.new{ }
	
	for k in pairs(a)
	do
		if not b[k]
		then
			result[k] = true
		end
	end
	
	return result
end

function Set.length(set)
	local length = 0
	
	for _ in pairs(set)
	do
		length = length + 1
	end
	
	return length
end

function Set.tostring(set)
	local list = { }
	
	for e in pairs(set)
	do
		list[#list + 1] = tostring(e)
	end
	
	return "{" .. table.concat(list, ", ") .. "}"
end

set_mt.__add = Set.union
set_mt.__mul = Set.intersection
set_mt.__sub = Set.difference
set_mt.__len = Set.length
set_mt.__tostring = Set.tostring

set1 = Set.new{ 1, 2, 3, 4, 5 }
set2 = Set.new{ 30, 20, 10, 1 }

print(set1)
print(set2)

print(#set1)
print(#set2)

print(set1 + set2)
print(set1 - set2)
print(set1 * set2)