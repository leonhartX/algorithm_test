
def get_prim_factor(num)
	factors = Array.new();
	sqrt = Math.sqrt(num);
	# puts sqrt.to_i;
	fac = 2
	while num > 1
		while num % fac == 0
			factors << fac
			num = num / fac
		end
		fac += 1
		if fac * fac > num
			factors << num
			break
		end
	end
	return factors
end

num = gets.chomp.to_i;
p get_prim_factor(num);
