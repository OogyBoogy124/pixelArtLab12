local function detectblock()
	ok, data = turtle.inspectDown()
	if ok and data.name:find("white") then
		print("0")
		key = 0
		line = "line=white"
		one_line = line
		http.post("https://cedar.fogcloud.org/api/logs/AF00", one_line)
	end
	if ok and data.name:find("yellow") then
		print("1")
		line2 = "line=yellow"
		two_line = line2
		http.post("https://cedar.fogcloud.org/api/logs/AF00", two_line)
	end
	if ok and data.name:find("gray") then
		print("2")
		line3 = "line=gray"
		three_line = line3
		http.post("https://cedar.fogcloud.org/api/logs/AF00", three_line)
	end
	if ok and data.name:find("green") then
		print("0")
		line4 = "line=green"
		four_line = line4
		http.post("https://cedar.fogcloud.org/api/logs/AF00", four_line)
	end
	if ok and data.name:find("red") then
		print("0")
		line5 = "line=red"
		five_line = line5
		http.post("https://cedar.fogcloud.org/api/logs/AF00", five_line)
	end
	return ok and data

end

local function scan()
	detectblock()
	turtle.forward()
end
loop = true
while loop == true do
	if ok and data.name:find("red") then
		print("0")
		line5 = "line=red"
		five_line = line5
		http.post("https://cedar.fogcloud.org/api/logs/AF00", five_line)
		loop == false
	end
	while turtle.detectDown() == true do
		scan()

	end
	turtle.turnRight()
	turtle.forward()
	turtle.turnRight()
	turtle.forward()
	while turtle.detectDown() == true do
		scan()
	end
	turtle.turnLeft()
	turtle.forward()
	turtle.turnLeft()
	turtle.forward()
end
