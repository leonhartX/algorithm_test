# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    hash = {}
    nums.each_with_index { |e, i|
        hash[e] = i + 1
    }
    p hash
    nums.each_with_index { |e, i|
    	return [i + 1, hash[target - e]] if hash[target - e] && (hash[target - e] != i + 1)
    }
end