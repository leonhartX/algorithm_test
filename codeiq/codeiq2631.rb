n, start, goal = gets.chomp.split(",").map(&:to_i)
if goal < start
	start = n - start + 1
	goal = n - goal	+ 1
end

def fac(n)
	return (1..n).reduce(1, :*) || 1
end

before = start - 1 + (goal - start - 1)
after = n - goal
before_pattern = fac(before)
after_pattern = fac(after)
i, j = 0, 0
pattern = 0
while i <= before && j <= after
	pattern += (before_pattern / fac(before - i)) * (after_pattern / fac(after - j))
	if i < j
		i += 1
	else
		j += 1	
	end
end

puts pattern