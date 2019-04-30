function volume_of_cone(height, angle)
	radius = height * math.tan(math.rad(angle))
	
	return height * (radius ^ 2) / 3.0
end

first_run = true

function random_normal_number()
	if first_run
	then
		math.randomseed(os.time())
		first_run = false
	end
	
	return math.random()
end

for i = 1, 10
do
	local random_angle = random_normal_number() * 90.0
	
	io.write(string.format("Volume of cone with height 10 and top angle %.2f: %.2f\n", random_angle, volume_of_cone(10.0, random_angle)))
end