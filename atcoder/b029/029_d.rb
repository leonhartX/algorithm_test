n = gets.chomp.to_i
p = 0
count = 0
n.to_s.length.times {
	m = n % (10 ** (p + 1))
	q = (m / (10 ** p))
	count += (q * (p * (10 ** (p-1))))
	if q > 1
		count += (10 ** p)
	elsif q == 1
		count += m % (10**p) + 1
	end
	p += 1
}

puts count.to_i