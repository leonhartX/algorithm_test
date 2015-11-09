n = gets.to_i
init = gets.chomp.split.map(&:to_i)
count = 0

sum = init.reduce(&:+)
if sum % n != 0
	puts -1
	exit
end

if init.uniq.length == 1
	puts 0
	exit
end

avg = sum / n
result = init
# p result
(0...(result.length-1)).each { |n|
	# p result[n]
	if result[n] != avg
		diff = avg - result[n]
		result[n+1] -= diff
		count += 1
	end
}

puts count