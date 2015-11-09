num,a,b = gets.chomp.split.map(&:to_i)
min = 10**9+1
max = 0
sum = 0
num.times { |n|  
	score = gets.chomp.to_i
	min = score if score < min
	max = score if score > max
	sum += score
}

if max == min
	puts -1
	exit	
end
p = b.to_f / (max - min)
q = a - ((sum.to_f / num) * p)
print "#{p.round(7)} #{q.round(7)}\n"