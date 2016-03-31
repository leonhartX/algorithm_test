count = 0
deci = gets.chomp.to_i
trit = deci.to_s 3
len = trit.length
trit.chars.each_with_index do |e, i|
	case e
	when "2"
		count += 2 ** (len - i)
		puts count
		exit
	when "1"
		count += 2 ** (len - i -1)
	end
end

puts count + 1