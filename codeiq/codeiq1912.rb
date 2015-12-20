n = gets.to_i
link = Array.new(n) { [] }
while (s = gets)
	a,b = s.split.map &:to_i
	link[a-1][b-1] = b
	link[b-1][a-1] = a
end

max = 0
n.times { |i|  
	n.times { |j|  
		next if i == j
		common = (link[i] & link[j]).size - 1
		max = common if common >= max
	}
}

puts max