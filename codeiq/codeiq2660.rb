first = gets.chomp
employees = []
relation = {}
9.times do
	employee, respect = gets.chomp.split(",")
	employees << employee
	if relation[respect]
		relation[respect] << employee
	else
		relation[respect] = [employee]
	end
end

canidate = relation[first]
while canidate.size > 0
	target = canidate.shift
	canidate += relation[target] if relation[target]
	employees.delete target
end

puts employees.size