n = gets.to_i
arr = gets.chomp.split.map(&:to_i)
arr.unshift(arr.first)
1.upto(n - 2) { |i|
	arr[i] = [arr[i],arr[i+1]].min
}
puts arr.join(" ")