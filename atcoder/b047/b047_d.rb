@n,@t = gets.chomp.split.map(&:to_i)
arr = gets.chomp.split.map(&:to_i)
benefit = []
max = 0
(@n - 1).downto(0) { |n|  
  benefit.push max - arr[n]
  max = arr[n] > max ? arr[n] : max
}

puts benefit.count(benefit.max)