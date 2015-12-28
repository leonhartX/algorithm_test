input = ""
while (s = gets)
	tmp =  s.chars.map { |i| 
		case i
		when "."
			0
		when "#"
			1
		end
	}
	input << tmp.join
end
puts input.to_i(2).to_s(36)