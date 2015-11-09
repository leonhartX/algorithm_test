command = gets.chomp
scores = []
plus = command.count("+")
minus = command.count("-")
move = command.count("M")

(0...command.length).each { |i|  
	case command[i]
	when "M"
		score = plus - minus
		scores << score
	when "+"
		plus -= 1
	when "-"
		minus -= 1
	end
}
if scores.length == 0
	puts 0
	exit
end
scores.sort!
happy = scores[move/2..-1].reduce(&:+) - scores[0...move/2].reduce(&:+)
p happy