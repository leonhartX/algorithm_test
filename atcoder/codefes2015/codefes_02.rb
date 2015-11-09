n = gets.to_i
arr = gets.chomp.split.map(&:to_i)
$sum = 0
0.upto(n-1) { |i|  
	$sum += arr[(n-1) - i] * (2**i)
}

puts $sum