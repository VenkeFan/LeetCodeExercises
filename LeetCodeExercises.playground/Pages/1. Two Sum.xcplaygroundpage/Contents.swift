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

func twoSum2(array: [Int], target: Int) -> (x: Int, y: Int)? {
    if (array.isEmpty) {
        return nil;
    }
    
    var i0 = 0, i1 = 0;
    var dic = [Int: Int]();
    
    for (_, value) in array.enumerated() {
        let temp = target - value;
        dic[temp] = value;
    }
    
    for (_, value) in array.enumerated() {
        if let key = dic[value] {
            i0 = key;
            i1 = value;
            return(i0, i1);
        }
    }
    
    return nil;
}

var list: [Int] = [1, 5, 2, 4, 3];
var sum = 9;

twoSum(array: list, target: sum);

twoSum2(array: list, target: sum);
