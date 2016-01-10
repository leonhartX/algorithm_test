require "set"
s = gets.chomp
k = gets.to_i
pos = 0
set = Set[]
while pos + k <= s.size
	set << [s[pos,k]]
	pos += 1
end
puts set.size