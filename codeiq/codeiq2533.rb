@m, @n = gets.split(",").map &:to_i
matrix = Array.new(@m * @n) { 0 }
@memo = {}
def solve(solved)
	key = solved.hash
	if @memo.has_key? key
		return @memo[key]
	else
		current = solved.index 0
		return 1 unless current
		workarr = solved.clone
		count = 0
		#for 1 * 1
		workarr[current] = 1
		count += solve(workarr)

		#for 2 * 2
		if ((current % @m < @m - 1) && (current / @m < @n- 1) && 
			(workarr[current + 1] + workarr[current + @m] + workarr[current + @m + 1] == 0))
			workarr[current + 1] = workarr[current + @m] = workarr[current + @m + 1] = 1
			count += solve(workarr)
			#for 4 * 2
			if ((current % @m < @m - 3) && (workarr[current + 2] + workarr[current + 3] + 
				workarr[current + @m + 2] + workarr[current + @m + 2] == 0))
				workarr[current + 2] = workarr[current + 3] = 
				workarr[current + @m + 2] = workarr[current + @m + 3] = 1
				count += solve(workarr)
				#for 4 * 4
				if ((current / @m < @n - 3) && ((workarr[(current + @m * 2)..(current + @m * 2 + 3)].reduce &:+) == 0) &&
					((workarr[(current + @m * 3)..(current + @m * 3 + 3)].reduce &:+) == 0))
						workarr[(current + @m * 2)..(current + @m * 2 + 3)] = 
						workarr[(current + @m * 3)..(current + @m * 3 + 3)] = [1,1,1,1]
						count += solve(workarr)
				end
			end	
		end

		@memo[key] = count
		return count		
	end
end

puts solve matrix
