n = gets.to_i

dp = [0, 0, 1]
(3..n).each { |i|  
	dp[i] = dp[i-1] + 1
	dp[i] = dp[i / 2] + 1 if i % 2 == 0 && dp[i / 2] < dp[i] - 1
}

puts dp[n]