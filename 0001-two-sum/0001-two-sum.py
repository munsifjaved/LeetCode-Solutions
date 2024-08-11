class Solution(object):
    def twoSum(self, nums, target):
        for i, num0 in enumerate(nums):
            for j, num1 in enumerate(nums):
                if i != j and target == (num0 + num1):
                    return [i, j]
        return [] 