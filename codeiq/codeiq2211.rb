output = Array.new(10) { Array.new(10) { 0 } }
s = gets
while (s = gets)
	date, max, min = s.chomp.split(",").map &:to_f
	output[((max + 10) / 5).to_i][((min + 10) / 5).to_i] += 1
end
puts ",-10<=min<-5,-5<=min<0,0<=min<5,5<=min<10,10<=min<15,15<=min<20,20<=min<25,25<=min<30,30<=min<35,35<=min<40"
output.each_with_index { |e, i|  
	puts "#{i * 5 - 10}<=max<#{(i + 1) * 5 - 10},#{e.join(",")}"
}