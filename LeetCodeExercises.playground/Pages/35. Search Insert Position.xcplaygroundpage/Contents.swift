//: [Previous](@previous)

import Foundation

/*
     Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
     You may assume no duplicates in the array.
 
     Here are few examples.
     [1,3,5,6], 5 → 2
     [1,3,5,6], 2 → 1
     [1,3,5,6], 7 → 4
     [1,3,5,6], 0 → 0
 */


func binarySearch(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count - 1;
    
    while left <= right {
        let middle = (left + right) / 2;
        
        if target < nums[middle] {
            right = middle - 1;
        } else if nums[middle] < target {
            left = middle + 1;
        } else {
            return middle;
        }
    }
    
    return left;
}


var array = [1,3,5,6,9,16];
var target = 0;

binarySearch(array, target);
