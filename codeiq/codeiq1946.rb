input = {}
while (s = gets)
  i = s.chomp.to_i
  if input[i]
    input[i] += 1
  else
    input[i] = 1    
  end
end

count = 0
input.each{ |k, v|
  if input[-k] && input[-k] > 0
    count += 1
    input[k] -= 1
    input[-k] -= 1
  end
}

puts count