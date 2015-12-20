input  = gets.chomp.split ","
result = 0
(1..10).each { |i| 
	result += 10 if input[i] == input[0]
}

puts "#{result}%"