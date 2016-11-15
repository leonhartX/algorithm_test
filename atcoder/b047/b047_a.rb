a, b, c = gets.chomp.split.map(&:to_i).sort
puts (a + b == c) ? "Yes" : "No"