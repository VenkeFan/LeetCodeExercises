//: [Previous](@previous)

import Foundation

/*
     Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
 
     Do not allocate extra space for another array, you must do this in place with constant memory.
 
     For example,
     Given input array nums = [1,1,2],
 
     Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.
 */


/// 原理就是维护两个快慢指针
func removeDuplicatesOfMine(_ nums: inout [Int]) -> Int {
    var length = nums.count;
    var previous = 0, current = 0;

    for i in 0..<nums.count - 1 {
        if nums[i] == nums[i + 1] {
            length -= 1;
        } else {
            current = i + 1;
            previous += 1;
            nums[previous] = nums[current];
        }
    }
    
    return length;
}


/// 别人的解法
func removeDuplicates(_ nums: inout [Int]) -> Int {
    if (nums.count <= 1) {
        return nums.count;
    }
    
    var pre = 0, cur = 0;
    while (cur < nums.count) {
        if (nums[cur] != nums[pre]) {
            pre += 1;
            nums[pre] = nums[cur];
        }
        cur += 1;
    }
    return pre + 1;
}


var array = [1, 1, 1, 1, 2, 5, 5, 5, 5, 8, 8, 9, 9, 10];

removeDuplicatesOfMine(&array);
array;

removeDuplicates(&array);
array;

