m,n = gets.chomp.split.map &:to_i
r_n = n * 6
r_m = (m % 12) * 30 + (n.to_f / 2)
r = (r_m - r_n).abs
r = 360 - r if r > 180
puts r