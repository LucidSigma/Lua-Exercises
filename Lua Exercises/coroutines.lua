co = coroutine.create(function()
		for i = 1, 10
		do
			print(i)
			coroutine.yield()
		end
	end)

for i = 1, 10
do
	coroutine.resume(co)
end

function print_result(a)
	for i = 1, #a do
		io.write(a[i], " ")
	end
	
	io.write("\n")
end

function permutation_generator(a, n)
	n = n or #a
	
	if n <= 1
	then
		coroutine.yield()
	else
		for i = 1, n
		do
			a[n], a[i] = a[i], a[n]
			
			permutation_generator(a, n - 1)
			
			a[n], a[i] = a[i], a[n]
		end
	end
end

function permutations(a)
	return coroutine.wrap(function()
			permutation_generator(a)
		end)
end

for p in permutations({ "a", "b", "c" })
do
	print_result(p)
end
