a1, a2 = gets.split.map &:to_i
b1, b2 = gets.split.map &:to_i
c = gets.to_i

all = [[a1,b1],[a1,b2],[a2,b1],[a2,b2]]
n = 0
result = []
all.each { |a|
	if a.include? c
		a.delete c
		result << ((a.length) > 0 ? a[0] : c)
	end
}
result.uniq!
puts result.length
puts result.sort