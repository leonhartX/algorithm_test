w = gets.to_i
s = "DiscoPresentsDiscoveryChannelProgrammingContest2016"
pos = 0
while pos + w < 51
	puts s[pos,w]
	pos += w
end
puts s[pos..-1]