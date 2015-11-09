count = 0
12.times {  
	count += 1 if gets.include? "r"
}
puts count