m = n = 999
res = Array.new()
mid = Math.sqrt(999)
while m > mid
	n = 999
	while n > mid
		pro = (m * n).to_s
		# printf("%d*%d=%s\n",m,n,pro)
		if pro == pro.reverse
			# printf("%d*%d=%s\n",m,n,pro)
			res << pro.to_i
		end
		n -= 1
	end
	m -= 1
end

p res.sort