//: [Previous](@previous)

import Foundation

/*
     Reverse digits of an integer.
 
     Example1: x = 123, return 321
     Example2: x = -123, return -321
 
     Note:
     The input is assumed to be a 32-bit signed integer. Your function should return 0 when the reversed integer overflows.
 */


func reverseOfMine(_ x: Int) -> Int {
    if x > INT32_MAX || x < -INT32_MAX {
        return 0;
    }
    
    var result = 0;
    var temp = x;
    
    while temp != 0 {
        result = result * 10 + temp % 10;
        temp /= 10;
    }
    
    if result > INT32_MAX || result < -INT32_MAX {
        result = 0;
    }
    
    return result;
}


/// 别人的解法
func reverseOfOthers(_ x: Int) -> Int {
    var result = 0;
    var temp = x;
    // 123
    while (temp != 0) {
        let tail = temp % 10;
        let newResult = result * 10 + tail;
        
        if ((newResult - tail) / 10 != result) {
            return 0;
        }
        result = newResult;
        temp /= 10;
    }
    
    return result;
}


/// 官方解答
func reverse(_ x: Int) -> Int {
    var res = 0;
    var temp = x;
    
    while (temp != 0) {
        // 考虑int溢出
        if (abs(res) > INT_MAX / 10) {
            return 0;
        }
        res = res * 10 + temp % 10;
        temp /= 10;
    }
    return res;
}


var x = 1000000009;

reverseOfMine(x);

reverseOfOthers(x);

reverse(x);

