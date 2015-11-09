num,min,max = gets.chomp.split.map(&:to_i)

result = 0
num.times { |n|  
	direct, distance = gets.chomp.split
	distance = distance.to_i
	distance = min if distance < min
	distance = max if distance > max
	case direct
	when "East"
		result += distance
	when "West"
		result -= distance
	end
}

print("East #{result}\n") if result > 0
print("West #{-result}\n") if result < 0
print("0\n") if result == 0