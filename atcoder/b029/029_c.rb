n = gets.chomp.to_i
$dict=["a","b","c"]

def output(n, str)
	if n == 0
		puts str
		return
	end
	3.times { |i|  
		new_str = str.clone
		new_str << $dict[i]
		output(n - 1, new_str)
	}
end

output(n, "")