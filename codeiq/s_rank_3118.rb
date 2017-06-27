first = gets.chomp.chars.map &:to_i
length = first.length
numbers = [first]
1.upto(length - 1) {|i|
  numbers[i] = gets.chomp.chars.map &:to_i
}

dp = Array.new(length) { Array.new(length) {0} }
dp[0][0] = numbers[0][0]
1.upto(length - 1) { |i|
  dp[i][0] = dp[i-1][0] + numbers[i][0]
  dp[0][i] = dp[0][i-1] + numbers[0][i]
}
1.upto(length - 1) { |y| 
  1.upto(length - 1) { |x|
    dp[y][x] = [dp[y][x-1], dp[y-1][x]].min + numbers[y][x]
  }
}
p dp[length-1][length-1]
