input = gets.chomp[1...-1].split(",")
len = [2,3,4,6]

def check_word(check,word,l,r)
	return true if l == 12
	return false if check != word[l...r]
	return check_word(check,word,r,r+l)
end

input.each_index { |i|  
	flag = false
	len.each { |l|
		r = l + l
		check = input[i][0...l]
		flag = check_word(check,input[i],l,r)
		break if flag
	}
	if i == input.length - 1
		print("#{flag ? 1 : 0}\n")
	else
		print("#{flag ? 1 : 0},")
	end
}

# puts result