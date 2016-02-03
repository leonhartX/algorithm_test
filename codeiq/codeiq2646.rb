n,m = gets.split(",").map(&:to_i)
dp = Array.new(m + 1) { Array.new(n + 1) { 0 } }
0.upto(n) { |i| dp[1][i] = 1 }
2.upto(m) { |i|  
	0.upto(n) { |j|
		# p "day:#{i}, page:#{j}"
		base = (1..i).reduce(&:+)
		remain = j - base
		max_page = [remain / i + 1, 0].max
		# p "max_page:#{max_page}"
		1.upto(max_page) { |k|  
			used = k * i
			# p "#{used}, #{dp[i-1][j-used]}"
			dp[i][j] += dp[i-1][j-used]
		}
		# p "dp[#{i}][#{j}] = #{dp[i][j]}"
	}
}
res = 0
dp.each { |arr|
	res += arr[n]
}
# puts dp[m][n]
puts res