comment = 0
code = 0
while (s = gets)
	if(s[0] == "#")
		comment += 1
	else
		code += 1
	end
end
puts "code:#{code}"
puts "comment:#{comment}"
