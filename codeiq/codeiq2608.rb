@h = 10
@w = 7
@memo = {}
@min_combo = nil

def solve(fixed, status)
	pos = status.index 0 
	return 1 unless pos
	return @memo[status] if @memo[status]

	result = 0
	tmp_result = 0
	if ((pos + 1) % @w != 0) && (status[pos + 1] == 0) #check for horizontal pair
		fixed << [pos, pos + 1] #add to fixed pairs
		status[pos] = status[pos + 1] = 1 #mark current pair as used
		tmp_result = solve(fixed, status)
		if tmp_result == 1 && (!@min_combo || fixed.size <= @min_combo.size) #if remain space only have 1 pattern, save current fixed pairs
			@min_combo = fixed.dup
		end
		result += tmp_result
		fixed.pop #restore env
		status[pos] = status[pos + 1] = 0
	end
	if (pos < @w * (@h - 1)) && (status[pos + @w] == 0) #check for vertical pair
		fixed << [pos, pos + @w]
		status[pos] = status[pos + @w] = 1
		tmp_result = solve(fixed, status)
		if tmp_result == 1 && (!@min_combo || fixed.size <= @min_combo.size)
			@min_combo = fixed.dup
		end
		result += tmp_result
		fixed.pop
		status[pos] = status[pos + @w] = 0
	end
	@memo[status.dup] = result
	return result
end

status = Array.new(@h * @w) { 0 }
try = solve([], status)
count = 0
process = []
while try > 1 #when result is bigger than 1, disabled the last fixed pair
	count += 1
	x, y = @min_combo.pop
	process << [x,y]
	@memo = {}
	status[x] = status[y] = 1
	try = solve([], status)
end
p count
p process #disabled pair
