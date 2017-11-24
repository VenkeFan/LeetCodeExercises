//: [Previous](@previous)

import Foundation

/*
     Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
     You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
     Example:
     Given nums = [2, 7, 11, 15], target = 9,
 
     Because nums[0] + nums[1] = 2 + 7 = 9,
     return [0, 1].
 */


/// 暴力解法（时间复杂度为n^2）
func twoSumOfMine(array: [Int], target: Int) -> (x: Int, y: Int)? {
    if (array.isEmpty) {
        return nil;
    }
    
    for i in 0..<array.count {
        for j in (i + 1)..<array.count {
            if array[i] + array[j] == target {
                return (i, j);
            }
        }
    }
    
    return nil;
}


/// 别人的解法（时间复杂度为n）
func twoSum(array: [Int], target: Int) -> (x: Int, y: Int)? {
    if (array.isEmpty) {
        return nil;
    }
    
    var i0 = 0, i1 = 0;
    var dic = [Int: Int]();
    
    for (index, value) in array.enumerated() {
        
        let temp = target - value;
        
        if let key = dic[temp] {
            i0 = key;
            i1 = index;
            return (i0, i1);
        }
        
        dic[value] = index;
    }
    
    return nil;
}


var list: [Int] = [1, 5, 2, 4, 3];
var sum = 9;

twoSumOfMine(array: list, target: sum);

twoSum(array: list, target: sum);
