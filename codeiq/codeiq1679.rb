m,n = gets.chomp.split(",").map(&:to_i)
pow_m = [1, m]
pow_n =[1, n]
p = 10
str = ""
dict={}
index = 10
0.upto(10) { |n|  
	dict[n] = n.to_s
}

"a".upto("z") { |s|
	dict[index] = s
	index += 1
}
while true
	pow = pow_m
	i = 1
	p_m = p
	while p_m > pow[i]
		i += 1
		pow[i] = pow[i-1] * pow[1] if !pow[i] 
	end
	i -= 1
	str = ""
	while i >= 0
		tmp = p_m / pow[i]
		p_m -= tmp * pow[i]
		i -= 1
		str << dict[tmp]
	end
	if str != str.reverse
		p += 1
		next
	end

	pow = pow_n
	i = 1
	p_n = p
	while p_n > pow[i]
		i += 1
		pow[i] = pow[i-1] * pow[1] if !pow[i] 
	end
	i -= 1
	str = ""
	while i >= 0
		tmp = p_n / pow[i]
		p_n -= tmp * pow[i]
		i -= 1
		str << dict[tmp]
	end

	if str == str.reverse
		puts p
		exit 0
	else
		p += 1
	end
end
