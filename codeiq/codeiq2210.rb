str = gets.chomp
arr1 = str.chars[0...6]
arr2 = str.chars[6..-1]
count = 0
6.times { |i|  
	if arr1[i] == arr2[i]
		count += 2
	elsif arr1[i] != " " && arr2[i] != " "
		count += 1
	end
}
puts count