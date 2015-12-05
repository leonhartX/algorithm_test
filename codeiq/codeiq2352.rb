require "bigdecimal"

a = BigDecimal(gets)
p, q = 0
min_frac = 1

(1..999999).each { |i|  
	b = a * i
	next if b > 999999
	p, min_frac, q = b.fix.to_i, b.frac, i if b.frac < min_frac
	p, min_frac, q = b.fix.to_i + 1, 1 - b.frac, i if 1 - b.frac < min_frac
}

puts "#{p} #{q}"