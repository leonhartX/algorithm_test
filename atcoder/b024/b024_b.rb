n,t = gets.split.map &:to_i
count = t
pre = gets.to_i
(n-1).times {
	i = gets.to_i
	count += (i - pre >= t ? t : i - pre)
	pre = i
}
puts count