n = gets.to_i
h = {}
count = 0
n.times {  
	a = gets.to_i
	count += 1 if h[a]
	h[a] = 1 unless h[a]
}
puts count