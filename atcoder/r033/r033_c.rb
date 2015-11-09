num = gets.to_i
$length = 200001
$bit = Array.new($length) { 0  }
def bit_add(i, value)
	while i <= $length
		$bit[i] += value
		i += i & -i
	end
end

def bit_sum(i)
	sum = 0
	while i > 0
		sum += $bit[i]
		i -= i & -i
	end
	return sum
end

num.times { |n|  
	t,x = gets.chomp.split.map(&:to_i)
	# p bitmap
	if t == 1
		bit_add(x, 1)
	else
		l = 0
		r = 200000
		while l + 1 < r
			mid = (l + r)/2
			m = bit_sum(mid)
			# print "mid: #{mid}, m:#{m}\n"
			if m < x
				l = mid							
			else
				r = mid	
			end
		end
		# print "l:#{l}, r:#{r}\n"
		p (l + 1)
		bit_add(l+1, -1)
		next
	end
}