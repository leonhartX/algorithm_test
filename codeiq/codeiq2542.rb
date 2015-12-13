(1..100).each { |i|  
	if i % 15 == 0
		puts "FizzBuzz"
		next 
	elsif i % 5 == 0
		puts "Buzz"
		next
	elsif i % 3 ==0
		puts "Fizz"
	else
		puts i
	end
}