n = gets.to_i
if n % 2 == 0
	puts 0
	exit
end

n /= 2
dp = [1, 1, 2]
(3..n).each { |i|
	dp[i] = 0 
	(0..i-1).each { |e|  
		dp[i] += dp[e] * dp [i-e-1]
	}
}

puts dp[n]