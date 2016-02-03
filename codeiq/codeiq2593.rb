n = gets.to_i
new_status = {1=>1, 2=>0, 4=>0, 6=>0, 8=>0}
puts 1
1.upto(n-1) {
	status = new_status.dup
	new_status = {}
	new_status[1] = status[6] + status[8]
	new_status[2] = status[1] + status[6]
	new_status[4] = status[2]
	new_status[6] = status[8]
	new_status[8] = status[4]
	puts new_status.values.reduce(&:+)
}