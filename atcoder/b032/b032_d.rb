n, cap = gets.chomp.split.map &:to_i
values = []
weights = []
max_v = max_w = 0
n.times { |i|
	v, w = gets.chomp.split.map &:to_i
	next if w > cap
	values << v
	weights << w
	max_v = [max_v, v].max
	max_w = [max_w, w].max
}
n = values.size
if n <= 30
	dp = {}
	dp[0] = 0
	tmp_dp = dp.dup
	n.times { |i|
		v = values[i]
		w = weights[i]
		dp.each { |key, val|
			next if key + w > cap || val + v < (dp[key + w] || 0) 
			tmp_dp[key + w] = val + v
		}
		dp = tmp_dp.dup
	}
	puts dp.to_a.transpose[1].max
elsif max_w <= 1000
	cap = [n * 1000, cap].min
	dp = Array.new(cap + 1) { 0 }
	count_w = 0
	n.times { |i|
		v = values[i]
		w = weights[i]
		count_w += w
		count_w = cap if count_w > cap
		count_w.downto(w) { |j|  
			dp[j] = [dp[j], dp[j - w] + v].max
		}
	}
	puts dp.max
else
	all_v = values.reduce &:+
	limit = 1 << 60
	dp = Array.new(all_v) { limit }
	dp[0] = 0
	count_v = 0
	n.times { |i|  
		v = values[i]
		w = weights[i]
		count_v += v
		count_v.downto(v) { |j|
			dp[j] = [dp[j], dp[j-v] + w].min
		}
	}
	puts (all_v - dp.reverse.index {|w| w <= cap} - 1)
end