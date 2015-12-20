n, m = gets.split(",").map &:to_i
q = [(1..n).to_a]
count = 0
splited = 0
m.times { |i|  
	count += 1
	splited += i + 1
	if splited >= n - 1
		puts count
		exit
	end
}
count += (n - 1 - splited) / m
count += 1 if (n - 1 -splited) % m > 0
puts count