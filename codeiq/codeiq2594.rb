@n = gets.to_i
@v = []
s = []
@n.times { |i| 
	@v[i] = gets.to_i
	s << i
}
@v << 0
@allAmount = @v.reduce &:+
@memo = {}

def solve(status, current)
	return @memo[[status, current]] if @memo.has_key? [status, current]
	if status.size == 0
		@memo[[status, current]] = [0, @allAmount - @v[current]] 
		return @memo[[status, current]]
	end
	minCost = nil
	minWeight = @allAmount
	@n.times { |i|  
		prev = status.clone
		next unless prev.include? i
		prev.delete i
		cost, weight = solve(prev, i)
		cost += (@v[i] * @v[current]) * weight
		minCost, minWeight = cost, weight - @v[current] if (!minCost || cost <= minCost)
	}
	@memo[[status, current]] = [minCost, minWeight]
	return @memo[[status, current]]
end

r = solve(s, @n)
puts r[0]