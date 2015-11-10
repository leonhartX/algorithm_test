n = gets.to_i
i = 1
(1..n).each { |j|  
	if i % j > 0
		(1..n).each { |k|  
			if (i * k) % j == 0
				i *= k
				p k
				break
			end
		}
	end
}
p i