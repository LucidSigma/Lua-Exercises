function value_or_null(var)
	local E = { }
	
	return var or E
end

function polynomial(p, x)
	local result = 0
	
	for i = 0, #p
	do
		result = result + (p[i] * (x ^ i))
	end
	
	return result
end

function print_array(...)
	for _, v in ipairs({ ... })
	do
		print(v)
	end
end

function remove_first(...)
	return table.unpack({ ... }, 2)
end

function remove_last(...)
	return table.unpack({ ... }, 1, table.pack(...).n - 1)
end

print(value_or_null(nil))
print(value_or_null(1))

print(polynomial({ [0] = 1, [1] = 3, [2] = 5, [3] = 2 }, 5))

print_array(6, 9, 23, 5, "hello", false, 2, 0)

print_array(remove_first(1, 2, 3, 4))
print_array(remove_last(1, 2, 3, 4 ))