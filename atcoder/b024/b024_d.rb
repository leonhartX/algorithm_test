_A = gets.to_i
_B = gets.to_i
_C = gets.to_i

m = 1000000007

cx = ((_B * _C) % m) - ((_A * _B) % m)
cy = (((_A * _C) % m) - ((_B * _C) % m) + ((_A * _B) % m)) % m