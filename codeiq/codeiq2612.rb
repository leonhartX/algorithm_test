def helloworld(n)
	str = ""
	n.times { str << "HelloWorld"  }
	puts str
end

def fizzbuzz(n)
	if n % 15 == 0
		puts "FizzBuzz"
	elsif n % 3 == 0
		puts "Fizz"
	elsif n % 5 == 0
		puts "Buzz"
	else
		puts n
	end
end

def prime(n)
	prime_number = [2]
	i = 3
	while prime_number.length < n
		sqrt = Math.sqrt(i)
		flag = true
		prime_number.each { |e|
			if i % e == 0
				flag = false
				break
			end
			break if e > sqrt
		}
		prime_number << i if flag
		i += 1
	end
	puts prime_number.pop
end

def fib(n)
	fib = [1,1]
	(2...n).each{|i|
		fib[i] = fib[i - 2] + fib[i - 1]
	}
	puts fib[n-1]
end

method, param = gets.split(",")
param = param.to_i
case method
when "HelloWorld"
	helloworld(param)
when "FizzBuzz"
	fizzbuzz(param)
when "Prime"
	prime(param)
when "Fibonacci"
	fib(param)
end
