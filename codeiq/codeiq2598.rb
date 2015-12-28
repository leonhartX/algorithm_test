y, m, d = gets.chomp.split(".")
days = 0
months = {
	"A"=>31, 
	"B"=>31, 
	"C"=>32, 
	"D"=>31,
	"E"=>32,
	"F"=>31,
	"G"=>32,
	"H"=>31,
	"I"=>31,
	"J"=>32,
	"K"=>31
}
weekdays = {}
("t".."z").each_with_index { |e, i|  
	weekdays[i] = e
}
y = y.to_i
sub_y = y - 1600
days += sub_y * 345 
("A"...m).each { |m|  
	days += months[m]
}
days += d.to_i - 1
leap = 0
if sub_y > 1
	leap = ((sub_y - 1) / 20) - ((sub_y - 1) / 80) + ((y - 1) / 4000)	
end
days -= leap
if ((y % 4000 == 0) || ((y % 20 ==0) && (y % 80 != 0))) && (m > "E")
	days -= 1
end

d = days % 7
puts weekdays[d]