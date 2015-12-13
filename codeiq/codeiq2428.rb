raw = gets.chomp
p = raw.gsub("/","").index("s") 
start = p % 6, p / 6 
p = raw.gsub("/","").index("g") 
goal = p % 6, p / 6

grid = raw.split("/").map { |row|  
	row.chars.map { |c|
		case c
		when "_"
			0
		when "s"
			1
		when "g"
			2
		end
	}
}

stack = [[start[0],start[1],nil]]
step = {}
step[[start[0],start[1],nil]] = 0
while stack.length > 0
	x, y, direct = stack.shift
	if [x,y] == goal
		puts step[[x,y,direct]]
		exit
	end
	if direct != "l" && x > 0 && grid[y][x - 1] && !step[[x - 1, y, "l"]]
		stack << [x - 1, y, "l"]
		step[[x - 1, y, "l"]] = step[[x, y, direct]] + 1		
	end
	if direct != "r" && x < 5 && grid[y][x + 1] && !step[[x + 1, y, "r"]]
		stack << [x + 1, y, "r"]
		step[[x + 1, y, "r"]] = step[[x, y, direct]] + 1	
	end
	if direct != "u" && y > 0 && grid[y - 1][x] && !step[[x, y - 1, "u"]]
		stack << [x, y - 1, "u"]
		step[[x, y - 1, "u"]] = step[[x, y, direct]] + 1
	end
	if direct != "d" && y < 5 && grid[y + 1][x] && !step[[x, y + 1, "d"]]
		stack << [x, y + 1, "d"] 
		step[[x, y + 1, "d"]] = step[[x, y, direct]] + 1	
	end
end
puts "X"