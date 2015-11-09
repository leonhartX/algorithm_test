num = gets.to_i
input = []
num.times { 
	input << gets.to_i
}
if num % 2 != 0
	input.unshift(0)
	num += 1
end
sum = 0
input.sort!
(num-1).step(1, -2) { |n|  
	sum += (input[n]+input[n-1]) * (input[n]-input[n-1])
}

puts Math::PI * sum