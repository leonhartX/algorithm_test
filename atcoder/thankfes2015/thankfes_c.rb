n = gets.to_i
h = gets.split.map &:to_i
x = gets.to_i

h.sort!
i = 0
while h[i] && h[i] < x
	i += 1	
end

puts i + 1