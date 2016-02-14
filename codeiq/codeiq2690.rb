require "date"
schedule = []
(10*10*60).times do |n|
	hour = n % 600
	if (hour >= 3 * 60 && hour < 4 * 60) || (hour >= 9 * 60) || n / 600 == 8
		schedule[n] = 1
	else
		schedule[n] = 0
	end
end
while (s = gets)
	item = s.chomp.split(",")
	date = DateTime.parse(item[1] + "," + item[2])
	day = date.day > 7 ? date.day - 2 : date.day
	pos = (day - 1) * 600 + (date.hour - 9) * 60 + date.minute
	endtime = item[3].split(":").map(&:to_i)
	endpos = (day - 1) * 600 + (endtime[0] - 9) * 60 + endtime[1]
	(pos..endpos).each do |i|
		schedule[i] |= 1
	end
end
puts schedule.join.squeeze.count("0")