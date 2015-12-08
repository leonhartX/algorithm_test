n = gets.to_i
s = Array.new(n) { [] }
all = 0
n.times { |i|
	s[i][i] = gets.to_i
	all += s[i][i]
}

result = ""
m = gets.to_i
m.times { |i|  
	a,b,c = gets.split.map &:to_i
	b -= 1
	c -= 1
	if a == 0
		s[b][c] = s[c][c]
	elsif a == 1
		if s[b][c]
			result += "#{s[b][c]} #{s[b][c]}\n"
		else
			tmp = s[b].clone
			tmp.delete nil
			remain = all - (tmp.reduce &:+)
			number = n - tmp.length
			min = [0, remain - (number - 1) * 100].max
			max = [100, remain].min
			result += "#{min} #{max}\n"
		end
	end
}

puts result