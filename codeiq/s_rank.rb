MAX = 9999999
m,n = gets.chomp.split.map &:to_i
map = []
map.push Array.new(n+2) {1}
m.times {|i|
  map[i+1] = gets.chomp.chars.map {|s| s == "."? 0 : 1}
  map[i+1].unshift 1
}
route = Array.new(m+2) {Array.new(n+2) { Array.new(4) {MAX}}}
route[1][1][0] = 0
route[1][1][2] = 0

loop do
  changed = false
  1.upto(m) { |y|
    1.upto(n) { |x|
      next unless map[y][x] == 0
      old = route[y][x].clone
      min = route[y][x].min
      route[y][x][0] = [route[y][x][0], route[y-1][x][0], route[y-1][x][1] + 1, route[y-1][x][2] + 1, route[y-1][x][3] + 1].min
      route[y][x][1] = [route[y][x][1], route[y+1][x][0] + 1, route[y+1][x][1], route[y+1][x][2] + 1, route[y+1][x][3] + 1].min
      route[y][x][2] = [route[y][x][2], route[y][x-1][0] + 1, route[y][x-1][1] + 1, route[y][x-1][2], route[y][x-1][3] + 1].min
      route[y][x][3] = [route[y][x][3], route[y][x+1][0] + 1, route[y][x+1][1] + 1, route[y][x+1][2] + 1, route[y][x+1][3]].min
      changed ||= (route[y][x] != old)
    }
  }
  break unless changed
end
puts route[m][n].min
