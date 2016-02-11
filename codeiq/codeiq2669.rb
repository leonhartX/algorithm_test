require "set"

INF = 1 << 60
@memo = {[1, 1] => 1}
@m, @n = gets.chomp.split(",").map(&:to_i)

def solve(arr, depth)
	return INF if depth >= @n
	x, y = arr
	return 1 if x == y
	return @memo[[x,y]] if @memo[[x,y]]
	res = 1 + solve([x, y - x].sort, depth + 1)
	@memo[[x, y]] = res
	return res
end

res = Set[]
1.upto(@m) do |x|
	x.upto(@m) do |y|
		if @n == solve([x, y].sort, 0)
			res << [x, y].sort
		end
	end
end
# p res
# p @memo
puts res.size