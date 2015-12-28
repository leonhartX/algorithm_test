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
days += (y.to_i - 500) * 345 
("A"...m).each { |m|  
	days += months[m]
}
days += d.to_i - 1
d = days % 7
puts weekdays[d]