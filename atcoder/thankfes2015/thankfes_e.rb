q = gets.to_i
s = []
t = []
q.times { |i|  
	s[i], t[i] = gets.split
}
q.times { |i|
	source = s[i]
	target = t[i]
	ps = pt = 0
	while source[ps] && target[pt]
		if source[ps] == target[pt]
			ps += 1
			pt += 1
		elsif (target.chars.include? source[ps]) && pt != 0
			pt = 0
		else
			ps += 1
		end
	end
	if pt == target.length
		puts "YES"
	else
		puts "NO"
	end
}