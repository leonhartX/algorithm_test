m, n = gets.split.map &:to_i
if n < 0 || m * 6 < n || n % 2 != 0
	puts "error"	
else
	max = m - ((n / 6) + (n % 6 == 0 ? 0 : 1))
	min = [m - (n / 2), 0].max
	puts "#{max} #{min}"
end