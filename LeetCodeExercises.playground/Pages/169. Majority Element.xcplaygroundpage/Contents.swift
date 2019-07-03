//: [Previous](@previous)

import Foundation

/*
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 
 You may assume that the array is non-empty and the majority element always exist in the array.
 
 Example 1:
 
 Input: [3,2,3]
 Output: 3
 
 Example 2:
 
 Input: [2,2,1,1,1,2,2]
 Output: 2
 */

func solution(_ array: [Int]) -> Int {
    var element = array[0];
    var map = [Int: Int]();
    
    for (_, value) in array.enumerated() {
        var count = 0;
        if let temp = map[value] {
            count = temp + 1;
            map[value] = count;
        } else {
            map[value] = 1;
        }
        
        if count >= Int(ceil(Double(array.count) / 2)) {
            element = value;
            break;
        }
    }
    
    return element;
}

func solution_voting(_ array: [Int]) -> Int {
    var element = -1;
    var count = 0;
    
    for (_, value) in array.enumerated() {
        if count == 0 {
            element = value;
        }
        
        count += (value == element) ? 1 : -1;
    }
    
    return element;
}

var array = [3,2,3];
//array = [7, 7, 5, 7, 5, 1 , 5, 7 , 5, 5, 7, 7 , 7, 7, 7, 7];
//array = [2,2,1,1,1,2,2];

solution(array);
solution_voting(array);
