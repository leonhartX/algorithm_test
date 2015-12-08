a = gets.to_i
b = gets.to_i

n  = 0
n += a.abs + (b-a).abs + b.abs
puts n