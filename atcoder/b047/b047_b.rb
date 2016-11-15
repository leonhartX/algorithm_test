@w,@h,@n = gets.chomp.split.map(&:to_i)
arr = Array.new(@w * @h) { 0 }
@n.times { |n|
  x, y, a = gets.chomp.split.map(&:to_i)
  case a
  when 1
    0.upto(@h - 1) { |h|
      0.upto(x - 1) { |xi|
        arr[h * @w + xi] = 1; 
      }
    }
  when 2
    0.upto(@h - 1) { |h|
      x.upto(@w - 1) { |xi|
        arr[h * @w + xi] = 1; 
      }
    }
  when 3
    0.upto(y * @w -1) { |i|
      arr[i] = 1;
    }
    
  when 4
    (y * @w).upto(@w * @h - 1) { |i|
      arr[i] = 1
    }
  end
}
puts arr.count(0)