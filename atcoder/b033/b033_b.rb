n = gets.to_i
a = []
all = 0
n.times do
	name, popular = gets.chomp.split
	a << [name, popular.to_i]
	all += popular.to_i
end
a.each do |city|
	if city[1] > all / 2
		puts city[0]
		exit
	end
end
puts "atcoder"