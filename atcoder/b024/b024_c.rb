n,d,k = gets.chomp.split.map &:to_i
days = []
d.times { |i|
	l,r = gets.chomp.split.map &:to_i
	days[i] = [l,r]
}
k.times { |i|  
	reverse = false
	s,t = gets.chomp.split.map &:to_i
	reverse = true if s > t
	m = 0
	while m < d
		if days[m][0] <= s && days[m][1] >= s
			if days[m][0] <= t && days[m][1] >= t
				puts m+1
				break				
			else
				s = reverse ? days[m][0] : days[m][1]
			end
		end
		m += 1			
	end
}