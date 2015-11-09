str = gets.chomp.chars.sort.join
num = gets.to_i
i1 = num / 5
i2 = num % 5
if i2 == 0
	i1 -= 1
end

i2 = i2 > 0 ? i2 - 1 : 4
print("#{str[i1]}#{str[i2]}\n")