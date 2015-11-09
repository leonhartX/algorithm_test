n, t = gets.chomp.split.map(&:to_i)
diff = []
a = []
b = []
n.times { |i|  
	a[i], b[i] = gets.chomp.split.map(&:to_i)
	diff[i] = a[i] - b[i]
}
diff.sort!
if b.reduce(&:+) > t
	p -1
	exit
end

now = a.reduce(&:+)
count = 0
while now > t
	now -= diff.pop
	count += 1
end

p count