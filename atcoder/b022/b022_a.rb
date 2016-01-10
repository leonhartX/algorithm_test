d, min, max = gets.chomp.split.map &:to_i
weight = gets.to_i
count = 0
count += 1 if weight >= min && weight <= max
(d - 1).times {  
	weight += gets.to_i
	count += 1 if weight >= min && weight <= max
}
puts count