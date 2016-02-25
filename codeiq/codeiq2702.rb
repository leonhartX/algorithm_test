n = gets.to_i

def fac(n)
	(1..n).reduce {|m ,i | m *= i }
end
ans = [0, 0, 1]

if n < 2
	puts ans[n]
	exit
end
3.upto(n) do |i|
	num = fac i
	ans[i] = num * (i-1)
	2.upto(i) do |j|
		num /= j
		ans[i] -= num
	end
end

puts ans[n]