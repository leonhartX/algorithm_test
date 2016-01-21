# @param {String} s
# @param {Set<String>} word_dict
# @return {String[]}
def word_break(s, word_dict)
max = word_dict.max_by{ |w| w.length }
return [] unless max

max = max.length
dp = []
dp[0] = [""]
i = 0
c =0
has_start = false
has_end = false
word_dict.each { |w|
	len = w.size
	has_start = true if w == s[0,len]
	has_end = true if w == s[-len, len]
}
return [] unless has_start && has_end
while i < s.length
	min = [i - max, 0].max
	(min..i).each do |j|
		c += 1
		if word_dict.include?(s[j..i]) && dp[j]
			dp[i+1] = [] unless dp[i+1]
			dp[j].each do |sentence|
				if sentence == ""
					dp[i+1] <<  s[j..i]
				else
					dp[i+1] << sentence + " " + s[j..i]
				end
			end
		end
	end
	i += 1
end
return dp[s.length] || []
end