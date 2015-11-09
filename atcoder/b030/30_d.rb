n,a = gets.chomp.split.map &:to_i
k = gets.to_i
b = gets.chomp.split.map &:to_i

searched=[]
to_find = a
while k > 0
	k -= 1
	to_find = b[to_find - 1]
	if searched.include? to_find
		searched.shift until searched[0] == to_find
		k = k % searched.length
		to_find = searched[k]
		break
	else
		searched.push to_find
	end
end

puts to_find