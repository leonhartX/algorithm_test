min,max = gets.chomp.split(",").map(&:to_i)
count = 0
min.upto(max - 1) { |n|  
	count += 1 if (n == n.to_s(2).reverse.to_i(2))
}

puts count