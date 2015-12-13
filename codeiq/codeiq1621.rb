$prime_number = [2]
def find_prime(num)
	sqrt = Math.sqrt(num)
	$prime_number.each { |e|
		return if num % e == 0
		break if e > sqrt
	}
	$prime_number << num
end

max = gets("\t\n").chomp.split.map &:to_i
max.unshift 2

0.upto(max.length - 2) { |i|
	if max[i+1] <= 2
	 	p 0
	 	next
	end 
	max[i].upto(max[i + 1] - 1) { |n|  
		find_prime(n)
	}
	p $prime_number.count
}