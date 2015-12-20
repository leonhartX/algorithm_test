n = gets.to_i
arr = Array.new(n + 1) { [] }
(n+1).times { |i|  
	arr[i][0] = arr[i][i] = 1
	next if i <= 1
	(1...i).each { |j|
		arr[i][j] = arr[i-1][j-1] + arr[i-1][j]
	}
}

count = 0
amount = [10000, 5000, 2000, 1000, 500, 100, 50, 10, 5, 1]
arr[n].each { |e|  
	amount.each { |a|
		next if e < a
		count += e / a
		e %= a
	}
}

puts count