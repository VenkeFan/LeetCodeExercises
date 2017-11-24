//: [Previous](@previous)

import Foundation

/*
     Given an array and a value, remove all instances of that value in place and return the new length.
 
     Do not allocate extra space for another array, you must do this in place with constant memory.
 
     The order of elements can be changed. It doesn't matter what you leave beyond the new length.
 
     Example:
     Given input array nums = [3,2,2,3], val = 3
 
     Your function should return length = 2, with the first two elements of nums being 2.
 */


func removeElementOfMine(_ nums: inout [Int], _ val: Int) -> Int {
    var length = nums.count;
    
    var previous = 0;
    
    for i in 0..<nums.count {
        if nums[i] == val {
            length -= 1;
        } else {
            nums[previous] = nums[i];
            previous += 1;
        }
    }
    
    return length;
}


var array = [1, 1, 2, 5, 5, 5, 5, 8, 8, 9, 9, 10];
var value = 1; // 5

removeElementOfMine(&array, value);
array;
