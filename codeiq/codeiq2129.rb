lable = gets.chomp
score = []
while (s = gets)
	score << s.chomp.split(",")
end
score.sort_by!{|a,b,c,d| [-b.to_i, -c.to_i, -d.to_i]}
puts lable
score.each{ |s|
	puts s.join(",")
}