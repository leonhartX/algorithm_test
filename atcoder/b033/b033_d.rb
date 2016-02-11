n = gets.to_i
h = []
memo = {}
acute = 0
right = 0
obtuse = 0
n.times do |i|
	x,y = gets.chomp.split.map(&:to_i)
	h << [x,y]
end
h.sort!

0.upto(n-3) do |i|
	(i+1).upto(n-2) do |j|
		(j+1).upto(n-1) do |k|
			edge = []
			edge << (memo[[i,j]] || ((h[i][0] - h[j][0])**2 + (h[i][1] - h[j][1])**2))
			edge << (memo[[i,k]] || ((h[i][0] - h[k][0])**2 + (h[i][1] - h[k][1])**2))
			edge << (memo[[j,k]] || ((h[j][0] - h[k][0])**2 + (h[j][1] - h[k][1])**2))
			memo[[i,j]] = edge[0] unless memo[[i,j]]
			memo[[i,k]] = edge[1] unless memo[[i,k]]
			memo[[j,k]] = edge[2] unless memo[[j,k]]
			edge.sort!

			s = edge[0] + edge[1] - edge[2]
			if s == 0
				right += 1
			elsif s > 0
				acute += 1
			else 
				obtuse +=1
			end
		end
	end
end
puts "#{acute} #{right} #{obtuse}"