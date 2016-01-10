n, k = gets.chomp.split.map &:to_i
all = []
max = 0
product = 1
pos = 0
n.times { |i|
	num = gets.to_i
	if num == 0
		puts n
		exit
	end
	all[i] = num
	product *= num
	if product <= k
		max = [max, i - pos + 1].max
	else
		while product > k && pos < i
			product /= all[pos]
			pos += 1
		end
	end
}
puts max