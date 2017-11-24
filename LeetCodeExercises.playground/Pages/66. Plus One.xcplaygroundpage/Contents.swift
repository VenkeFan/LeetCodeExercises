//: [Previous](@previous)

import Foundation

/*
     Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.
 
     You may assume the integer do not contain any leading zero, except the number 0 itself.
 
     The digits are stored such that the most significant digit is at the head of the list.
 */


func plusOneOfMine(_ digits: [Int]) -> [Int] {
    var result = digits;
    
    var index = result.count - 1;
    
    while index >= 0 {
        if result[index] < 9 {
            result[index] += 1;
            return result;
        }
        
        result[index] = 0;
        index -= 1;
    }
    
    var newResult: [Int] = Array<Int>.init(repeating: 0, count: result.count + 1);
    newResult[0] = 1;
    
    return newResult;
}


var array = [9, 9, 9];
plusOneOfMine(array);
