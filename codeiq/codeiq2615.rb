@memo = {}
def solve(liner, space)
	return liner if space == 1
	return @memo[[liner, space]] if @memo[[liner, space]]

	result = 1
	fixed = 2
	while (liner - fixed) > ((space - 1) * 2 - 1)
		result += solve(liner - fixed, space - 1)
		fixed += 1
	end
	@memo[[liner, space]] = result
	return result
end

l, h = gets.chomp.split(",").map(&:to_i)
s = l - h
if s == 0
	p 1	
elsif s < 0 || (l - 2) < (s * 2 - 1) 
	p 0
else
	p solve(l - 2 ,s)
end