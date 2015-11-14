B = []
C = []
MEMO = {}
2.times {
	B << (gets.split.map &:to_i)
}
3.times {
	C << (gets.split.map &:to_i)
}
ALL = [B,C].flatten.reduce &:+

def play(status,turn)
	return MEMO[status.hash] if MEMO[status.hash]
	score = 0
	if turn == 9
		2.times { |i| 
			3.times { |j|  
				score += B[i][j] if status[i][j] == status[i+1][j]
			}
		}
		3.times { |i|  
			2.times { |j|  
				score += C[i][j] if status[i][j] == status[i][j+1]
			}
		}
		MEMO[status.hash] = score
		return score
	end
	step = turn % 2
	score = step == 0 ? 0 : ALL
	3.times { |i|
		3.times { |j| 
			unless status[i][j]
				status[i][j] = step
				tmp = play(status, turn + 1)
				if step == 0
					score = tmp if tmp > score
				else 
					score = tmp if tmp < score
				end
				status[i][j] = nil
			end
		}
	}
	MEMO[status.hash] = score
	return score
end

status = Array.new(3) { [nil,nil,nil] }
result = play(status, 0)
puts result
puts ALL - result
