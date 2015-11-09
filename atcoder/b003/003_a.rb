n = gets.to_i
dic = []
0.upto(n - 1) { |i|  
	dic[i] = gets.chomp.reverse
}

dic.sort!
dic.each { |w|
	puts w.reverse
}