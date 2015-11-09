n = gets.to_i - 2

def c(n, m)
	return 1 if n==m
	((1..n).reduce &:*) / (((1..m).reduce &:*) * ((1..(n-m)).reduce &:*))
end

count = 1
2.step(n,2) { |i|  
	add = c((n / 2),i/2)
	count += ((add + c(n,i)) / 2)
}

puts count
