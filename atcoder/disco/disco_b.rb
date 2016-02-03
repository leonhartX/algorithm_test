n = gets.to_i
a = gets.chomp.split.map(&:to_i)
h = {}
a.each_with_index  do |e, i|
	if h[e]
		h[e] << i
	else
		h[e] = [i]
	end
end
sorted = h.sort.map{|k,v| v}
pos = 0
count = 1
sorted.each do |point|
	if point.first < pos && point.last > pos
		count += 1
		pos = (point.select{|x| x < pos}).last
	elsif point.last < pos
		count += 1
		pos = point.last
	else
		pos = point.last
	end
end
count -=1 if pos == 0
puts count