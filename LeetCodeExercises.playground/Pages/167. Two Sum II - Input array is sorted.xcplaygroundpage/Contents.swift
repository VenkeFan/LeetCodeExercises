//: [Previous](@previous)

import Foundation

/*
 Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
 
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
 
 Note:
 
 Your returned answers (both index1 and index2) are not zero-based.
 You may assume that each input would have exactly one solution and you may not use the same element twice.
 
 Example:
 
 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
 */

func twoSum(array: [Int], target: Int) -> (Int, Int) {
    var index1 = 0, index2 = array.count - 1;
    
    while index1 < index2 {
        let sum = array[index1] + array[index2];
        if sum == target {
            return (index1 + 1, index2 + 1);
        } else if sum > target {
            index2 -= 1;
        } else {
            index1 += 1;
        }
    }
    
    return (index1, index2);
}

var array = [2,7,11,15];
var target = 13;
twoSum(array: array, target: target);
