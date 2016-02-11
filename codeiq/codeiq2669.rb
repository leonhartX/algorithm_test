require "set"
m,n = gets.chomp.split(",").map(&:to_i)
res = Set[]
new_res = Set[]
1.upto(m) { |i| res << [i, i] }
2.upto(n) do
	res.each do |x, y|
		sum = x + y
		new_res << [sum, x].sort if [sum, x].max <= m
		new_res << [sum, y].sort if [sum, y].max <= m
	end
	res = new_res
	new_res = Set[]
end
puts res.size