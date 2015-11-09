n = gets.to_i
h = gets.to_i
w = gets.to_i
m = []
dx = [-1,0,1,-1,1,-1,0,1]
dy = [-1,-1,-1,0,0,1,1,1]
h.times {
	m << gets.chomp
}
p m
n.times {
	new_m = Array.new(h) { [] }
	h.times { |x|
		w.times { |y|  
			count = 0
			8.times { |i| 
				count += 1 if m[(x+dx[i])%h][(y+dy[i])%w] == "*"
				if m[x][y] == "*"
					new_m[x][y] = count == 2 || count == 3 ? "*" : "."
				else
					new_m[x][y] = count == 3 ? "*" : "."
				end
			}
		}
	}
	m = new_m.clone
}
puts m.map{|x|x.join}.join("\n")