words = gets.chomp.split
pos = 0
words.each_with_index { |w, i| 
	next if w.match(/^(\d+|Mr|Ms|Mrs|Mt)[!?.]$/)
	if w.match(/.*[!?.]$/)
		out = words[pos..i].join(" ")
		out << " "
		pos = i + 1
		puts out
	end
}
