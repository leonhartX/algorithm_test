input = gets.chomp.split.map(&:to_i)
diff = []
0.upto(2) { |i|  
	diff << (input[i+1] - input[i])
}
p diff
max = input[4] + input[3] + input[2]
result = max - diff[1]
result -= (diff[0] < diff[2] ? diff[0] : diff[2])
p result