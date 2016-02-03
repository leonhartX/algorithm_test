n = gets.to_i
input = gets.chomp
littleQ = input.chars.count("q")
bigQ = input.chars.count("Q")
puts [(littleQ * 2 + bigQ * 8) / 5, (littleQ * 10 + bigQ * 2) / 6, (littleQ + bigQ)].min