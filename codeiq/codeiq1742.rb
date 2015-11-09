n = gets.chomp.to_i
if n % 2 == 1
	puts 0
	exit
end
dp = []
dp[0] = 1
dp[2] = 1
if n < 4
	puts dp[n]
	exit
end

4.step(n, 2) { |i|  
	dp[i] = 0
	0.step(i - 2, 2) { |l|  
		r = i - 2 - l
		dp[i] += dp[l] * dp[r]
	}
}

puts dp[n]