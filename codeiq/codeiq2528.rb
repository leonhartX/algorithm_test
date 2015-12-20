output = ""
while (s = gets)
	output << s.gsub(/\d+\./, "1. ")
end
puts output