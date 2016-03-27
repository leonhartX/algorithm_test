def trans number
  row = (number - 1) / 5 + 1
  col = number - (row - 1) * 5
  return row, col
end

def check player, panels, number
  lv = -1;
  y, x = trans number
  return lv if panels[y][x] != ""
  # puts "row: #{y}, col: #{x}"
  diff = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
  #check lv3
  diff.each do |dy, dx|
    next_y, next_x = y + dy, x + dx
    if panels[next_y][next_x] != nil && panels[next_y][next_x] != ""
      lv = 0 if lv < 0
      while panels[next_y][next_x] != nil && panels[next_y][next_x] != "" && panels[next_y][next_x] != player
        next_y += dy
        next_x += dx
      end
      if panels[next_y][next_x] == ""
        lv = 1 if lv < 1
      elsif panels[next_y][next_x] == player
        if next_y != y + dy || next_x != x + dx
          lv = 2
          return lv
        end
      end
    end
  end
  return lv
end

players = ["R", "B", "W", "G"]
panels = (0..6).map { (0..6).map {nil} }


1.upto(25) do |i|
  row, col = trans i
  panels[row][col] = ""
end
4.times do |i|
  gets.chomp.split(",")[1..-1].each do |c|
    row, col = trans c.to_i
    panels[row][col] = players[i]
  end
end

if panels.flatten.count("") == 25
	puts "R,13"
	puts "B,13"
	puts "W,13"
	puts "G,13"
	exit
end

players.each do |player|
  answer = [[],[],[]]
  1.upto(25) do |n|
    # puts "for #{player}, with panel #{n}"
    lv = check(player, panels, n)
    answer[lv] << n if lv >= 0
  end
  answer.delete []
  answer = answer.last.unshift player
  puts answer.join(",")
end
