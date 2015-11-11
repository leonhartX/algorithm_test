r,c,k = gets.split.map &:to_i
rows = Array.new(r) { 0 }
cols = Array.new(c) { 0 }
n = gets.to_i
nodes = []
n.times {  
	ri,ci = gets.split.map &:to_i
	rows[ri-1] += 1
	cols[ci-1] += 1
	nodes << [ri-1, ci-1]
}
count = 0
point_row = {}
point_col = {}
rows.each_with_index { |node, i|  
	if point_row[node]
		point_row[node] += 1
	else
		point_row[node] = 1		
	end
}

cols.each_with_index { |node, i|  
	if point_col[node]
		point_col[node] += 1
	else
		point_col[node] = 1	
	end
}

point_row.each { |node, row_count|
	count += point_col[k - node] ? point_col[k - node] * row_count : 0
}

nodes.each { |node|
	count -= 1 if rows[node[0]] + cols[node[1]] == k
	count += 1 if rows[node[0]] + cols[node[1]] == k + 1
}

puts count