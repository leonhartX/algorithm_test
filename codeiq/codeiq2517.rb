require "prime"

def getNumber (x,y)
	return nil if x < 0 || y < 0
	if x >= y
		return x**2 + y + 1
	else
		return y**2 + (y * 2 + 1 - x)
	end
end

def getXYDistance (distance, square)
	result = []
	root = Math.sqrt(distance)
	(1..root).each { |x|
		y = square[distance - x ** 2]
		result << [x, y] if y
	}
	return result
end


square = {}

(0..10000).each do |e|  
	square[e ** 2] = e
end

x = y = 0
n = gets.to_i
group = Math.sqrt(n).to_i
m = n - group ** 2
if m == 0
	x, y = 0, group - 1
elsif m > group
	x, y = (group * 2 + 1) - m , group
else
	x, y = group, m - 1
end
result = []
dx = dy = 0

distance = 1
while true
	getXYDistance(distance, square).each do |dx, dy|  
		arr = getNumber(x - dx, y - dy), getNumber(x - dx, y + dy),
		      getNumber(x - dy, y - dx), getNumber(x + dy, y - dx),
		      getNumber(x + dx, y - dy), getNumber(x + dx, y + dy),
		      getNumber(x - dy, y + dx), getNumber(x + dy, y + dx)
		arr.uniq!
		arr.delete nil
		arr.each do |e|  
			result << e if Prime.prime? e
		end
	end
	if result.length > 0
		result.uniq!
		puts result.sort.join(",")
		exit
	end
	distance += 1
end