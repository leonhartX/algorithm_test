s = gets.chomp
cnt = 0
stack = []
pos = 0
while pos < s.size
	if s[pos] == "*"
		stack << s[pos + 1].to_i
		pos += 2
	elsif s[pos] == "+"
		cnt += 1 if stack.reduce(&:*) > 0
		stack = [s[pos + 1].to_i]
		pos += 2
	else
		stack << s[pos].to_i
		pos += 1
	end	
end
cnt += 1 if stack.reduce(&:*) > 0
puts cnt