a = gets.to_i
b = gets.to_i
n = gets.to_i
until n % a == 0 && n % b == 0
	n += 1
end
puts n