a,b,c,k = gets.split.map &:to_i
s,t = gets.split.map &:to_i
count = (s * a) + (t * b) - (s+t >= k ? (s+t) * c : 0)
puts count