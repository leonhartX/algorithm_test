all,now,sym = gets.chomp.split ","
all = all.to_i
now = now.to_i
str = ""
if now > all
	str = "invalid"
else
	(now * 100 / all).times { str << sym }
end
puts str