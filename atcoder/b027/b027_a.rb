input=gets.chomp.split.map(&:to_i)
if input[0] == input[1]
	puts input[2]
elsif input[0] == input[2]
	puts input[1]
else puts input[0]
end
	