require 'set'

def checkValid(s,m,n)
  q = [[1,1]]
  checked = Set.new
  count = 0
  while q.length > 0
    y,x = q.shift
    [[y-1,x],[y,x-1],[y,x+1],[y+1,x]].each {|dy, dx|
      if s[dy][dx] == s[y][x] && !checked.include?([dy,dx])
        count +=1
        q.push [dy,dx]
      end
      checked.add [dy,dx]
    }
  end
  count == m*n / 2
end


set = Set.new
m,n = gets.chomp.split.map &:to_i
if m % 2 == 1 && n % 2 == 1 
  puts 0
  exit
end
m,n = n,m if n % 2 == 1
base = Array.new(m + 2) {Array.new(n + 2) {nil}}
1.upto(m) { |y|
  1.upto(n) { |x|
    base[y][x] = 0
    base[y][x] = 1 if (x > (n / 2) && x < n + 1)
  }
}
set.add base
queue = []
queue.push base
while queue.length >0
  s = queue.shift
  1.upto(m) { |y| 
    1.upto(n) {|x|
      next if s[y][x] != 0
      valid = true
      tx, ty = n+1-x, m+1-y
      s[y][x] = 1
      s[ty][tx] = 0
      valid = checkValid s,m,n
      if valid && !set.include?(s)
        new_s = []
        s.each {|e| new_s << e.dup}
        queue.push new_s
        set.add new_s
      end
      s[y][x] = 0
      s[ty][tx] = 1
    }
  }
end
puts set.size / 2
