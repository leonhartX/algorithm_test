n = gets.to_i
h = []
s = []
max = 0
n.times { |i|
	h[i],s[i] = gets.split.map &:to_i
	tmp = h[i] + s[i] * (n - 1)
	max = tmp if max < tmp
}

def check(height,n,h,s)
	order = []
	n.times { |i|  
		return false if h[i] > height
		order << ((height - h[i]) / s[i])
	}
	order.sort!.each_index { |i|  
		return false if order[i] < i
	}
	return true
end

l = n
r = max
mid = (l + r) / 2
while mid != l
	if check(mid,n,h,s)
		r = mid
		mid = (l + r) / 2
	else
		l = mid
		mid = (l + r) / 2
	end	
end

puts r