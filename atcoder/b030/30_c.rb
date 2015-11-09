m,n = gets.chomp.split.map &:to_i
x,y = gets.chomp.split.map &:to_i
a = gets.chomp.split.map &:to_i
b = gets.chomp.split.map &:to_i
count = 0
back = -y
departure = 0
while departure = a.shift
	next if departure < back + y
	while back = b.shift
		next if back < departure + x
		count += 1
		break
	end
	break unless back
end

puts count