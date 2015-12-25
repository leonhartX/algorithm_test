require"set"
m, n = gets.chomp.split(",").map &:to_i
all = (m + 1) * n + (n + 1) * m
result = 0
if m == 1
	result = n * 2 + 2
elsif n == 1
	result = m * 2 + 2
elsif m % 2 == 1 && n % 2 == 1
	result = all - m - n + 2
else
	result = all - m - n
end
puts result