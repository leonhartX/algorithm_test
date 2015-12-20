input = []
while (s = gets)
	input << (/(\w*?)(\d*)\.(\w+)/.match s).to_a
end
p input
input.sort_by!{|all, a, b, c| [a, b.to_i, b, c]}
input.each{ |arr|
	puts arr[0]
}