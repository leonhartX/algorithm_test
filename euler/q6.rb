n = gets.to_i
sum = (1..n).reduce(&:+)
sum_square = sum * sum

square_sum = (1..n).reduce {|sum, e| 
	sum += e * e
}

p sum_square - square_sum

# (1 + 2 + ... + n)^2 = n^2 * (n+1)^2 * 1/4

# 1^2 + 2^2 + ... + n^2 = n * (n+1) * (2n+1) * 1/6