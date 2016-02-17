m,n = gets.chomp.split(",").map(&:to_i)
if n == 0 || m == 0
	puts 0
	exit
end
max = n / m

def fac(x, y)
	return 1 if x == y
	(1..x).reduce(&:*) / ((1..y).reduce(&:*) * (1..(x-y)).reduce(&:*))
end

cnt = 0
1.upto(max) do |i|
	result = 1
	1.upto(m) do |j|
		result *= fac(n - (j-1)*i, i)
	end
	cnt += result
end

puts cnt+1