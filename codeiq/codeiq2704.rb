types = {"F"=> 0, "W"=> 1, "T"=> 2}
dict = {0 => "F", 1 => "W", 2 => "T"}
type = types[gets.chomp]
base = gets.chomp.split.map(&:to_i)
0.upto(2) do |i|  
	dis = (i - type) % 3
	base[i] *= 2 if dis == 1
	base[i] /= 2 if dis == 2
end
0.upto(2) do |i|
	print dict[i] if base[i] == base.max
end
print "\n"
