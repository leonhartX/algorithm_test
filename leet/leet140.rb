s = gets.chomp
word_dict = gets.chomp.split
p s
p word_dict
words = s.chars.map { [] }
ava_words = {}

(s.length - 1).downto(0) { |n|  
	if ava_words[s[n]] != nil
		ava = ava_words[s[n]]
	else
		ava = word_dict.find_all { |word|  
			word.start_with? s[n]
		}
		ava_words[s[n]] = ava
	end

	next if ava.length == 0

	ava.each { |e|  
		if s[n..-1].start_with? e
			if n + e.length >= s.length
				words[n] << e
			elsif words[n+e.length].length > 0
				words[n] += words[n+e.length].map { |str| e + " " + str}
			end
		else
			next
		end
	}

}

#p words
print "number: #{words[0].length}\n"