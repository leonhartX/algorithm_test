n = gets.to_i
s = gets.chomp

if n % 2 == 0
	puts -1
	exit
end

c = n / 2
check = "b"
c.times { |i|  
	case i % 3
	when 0
		check = "a" + check + "c"
		next
	when 1
		check = "c" + check + "a"
		next
	when 2
		check = "b" + check + "b"
	end
}
if check == s
	puts c
else
	puts -1
end