input = gets.chomp
y = ('a'..input[0]).count
x = ('A'..input[1]).count
arr = (0..y).map { [] }

0.upto(y) { |i|  
	arr[i][0] = 0
	arr[i][1] = 1
}
0.upto(x) { |i|  
	arr[0][i] = 0
}

1.upto(y) { |i|  
	2.upto(x) { |j|  
		arr[i][j] = arr[i][j - 2] + arr[i][j - 1] + arr[i - 1][j]
	}
}
puts arr[y][x]