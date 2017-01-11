boy = Array.new(31) { 0 }
girl = Array.new(31) { 0 }

boy[0] = 1
girl[0] = 0
1.upto(31) { |i|
  boy[i] = boy[i-1] + girl[i-1];
  girl[i] = boy[i-1];
}
puts boy[30] + girl[30]