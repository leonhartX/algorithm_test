

n,k=gets.chomp.split.map(&:to_i)

max = n**3
pattern = (k-1) * (n-k) * 6
pattern += (k-1) * 3
pattern += (n-k) * 3
pattern += 1
result = 0.0
result = pattern.to_f / max
p result