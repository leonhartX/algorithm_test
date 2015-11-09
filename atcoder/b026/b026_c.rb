num = gets.to_i
$employee = {}
1.upto(num) { |i|
	$employee[i] = []
}
2.upto(num) { |i|
	boss = gets.to_i
	$employee[boss] << i if i != 1
}

target = $employee[1]

def get_salary(p)
	if $employee[p] == []
		return 1
	elsif $employee[p].length == 1
		return (get_salary($employee[p].first) * 2 + 1)
	else
		max = 0
		min = 2**20
		$employee[p].each { |e|  
			salary = get_salary(e)
			max = salary if salary > max
			min = salary if salary < min
		}
		return (max + min + 1)
	end
end


p get_salary(1)