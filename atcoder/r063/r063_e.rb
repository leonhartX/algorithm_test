n = gets.chomp.to_i
@node = {}
@point = {}
@default = {}

def try(v, p, processed)
  # print "v: #{v}, p: #{p}\n"
  # p processed
  # p @point
  return true if @point[v] == p && processed.length != 0
  return false if @default[v] != nil && @default[v] != p

  stack = @node[v] - processed
  oldP = @point[v]
  @point[v] = p
  stack.each { |nv|  
    res = try(nv, p - 1, processed + [v]) ? true : try(nv, p + 1, processed + [v])
    if (!res) 
      @point[v] = oldP
      return false
    end
  }
  return true
end

n.times { |i|
  @node[i+1] = []
  @point[i+1] = nil
}
(n-1).times {
  a, b = gets.chomp.split.map(&:to_i)
  @node[a].push b
  @node[b].push a
}
k = gets.chomp.to_i
k.times {
  v, p = gets.chomp.split.map(&:to_i)
  @point[v] = p
  @default[v] = p
}

start = @point.select { |k, v| v!=nil }
start = start.first
res = try(start[0], start[1], [])
if (res)
  puts "Yes"
  @point.sort.each { |pair|
    puts pair[1]
  }
else
  puts "No"
end
