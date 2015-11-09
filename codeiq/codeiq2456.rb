n = gets.to_i
count = 0
0.upto(n) { |i|  
	0.upto(n - i) { |j|  
		k = n - i - j
		next if (i == j && i >= k) || (j == k && j >= i) || (k == i && k >= j)
		count += 1
	}
}
puts count;