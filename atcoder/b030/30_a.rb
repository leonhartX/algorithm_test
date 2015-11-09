a,b,c,d = gets.chomp.split.map &:to_i

m = b/a.to_f
n = d/c.to_f

if m > n
	puts "TAKAHASHI"	
elsif m < n
	puts "AOKI"
else
	puts "DRAW"
end