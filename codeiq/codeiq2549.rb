n = gets.to_i
if n == 0
	puts 0
	exit
end
n -= 1 if n % 2 == 0
dp = []
dp[0] = 1
dp[1] = 2
result = 2
2.upto(n) { |i|  
	dp[i] = dp[i-2] + dp[i-1]
	result += dp[i] if i % 2 == 1
}

puts result