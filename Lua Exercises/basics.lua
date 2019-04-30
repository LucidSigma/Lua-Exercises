function twice(x)
	return x * 2.0
end

function factorial(n)
	if n < 0
	then
		return nil
	elseif n == 0
	then
		return 1
	else
		return n * factorial(n - 1)
	end
end

print(twice(factorial(3)))

function eight_queens_puzzle()
	local N = 8
	local solution_found = false
	
	local function is_place_ok(a, n, c)
		for i = 1, n - 1
		do
			if (a[i] == c) or (a[i] - c == c - n) or (a[i] + i == c + n) or (a[i] + c == c - n) or (a[i] - i == c - n)
			then
				return false
			end
		end
		
		return true
	end

	local function print_solution(a)
		for i = 1, N
		do
			for j = 1, N
			do
				io.write(a[i] == j and "X" or "-", " ")
			end
			
			io.write("\n")
		end
		
		io.write("\n")
	end

	local function add_queen(a, n)
		if solution_found
		then
			return
		end
		
		if n > N
		then
			print_solution(a)
			solution_found = true
		else
			for c = 1, N
			do
				if is_place_ok(a, n, c)
				then
					a[n] = c
					add_queen(a, n + 1)
				end
			end
		end
	end
	
	add_queen({ }, 1)
end

eight_queens_puzzle()