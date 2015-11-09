indexes = {}
s = ARGV[0]
t = ARGV[1]
char = t.chars
zero = Array.new(s.length) { 0 }


char.each_index { |i|  
	indexes[char[i]] = []
	index = s.index char[i]
	processed = 0
	while index
		indexes[char[i]] << (index + processed)
		processed += index + 1
		index = s[processed..-1].index char[i]
	end
}

# p indexes

if indexes.values.include? []
	puts 0
	exit
end

score = zero.clone
indexes[char[0]].each { |e|  
	score[e] = 1
}

char[1..-1].each { |c|  
	new_score = zero.clone
	indexes[c].each { |i|
		next if i == 0
		new_score[i] = score[0...i].reduce &:+
	}
	p new_score
	score = new_score
}

puts score.reduce &:+
