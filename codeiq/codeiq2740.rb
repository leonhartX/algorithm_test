reg = /(\w)(\w)(\1)/
while line=gets
  input = line.chomp
  while reg.match input
    input = input.sub(/(\w)(\w)(\1)/, '\2')
  end

  puts input
end
