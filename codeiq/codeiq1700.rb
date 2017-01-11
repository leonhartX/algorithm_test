@memo = {}
@n = 22

def solve(used, status)
	p "for used:#{used.to_s(2)}, status:#{status.to_s(2)}"
	mem = @memo[(used << @n) | status]
	return mem if mem
	return 1 if used == @n / 2
	num = used + 1
	result = 0
	(@n - num - 1).times { |i|
		l = 1 << i
		r = 1 << i + num + 1
		if status & l == 0 && status & r == 0
			result += solve(num, status | l | r)
		end
	}
	@memo[(used << @n) | status] = result
	return result
end

used = 0
status = 0

puts solve(used, status)