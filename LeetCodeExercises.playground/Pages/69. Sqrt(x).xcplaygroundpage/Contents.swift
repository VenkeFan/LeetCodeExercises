//: [Previous](@previous)

import Foundation

/*
     Implement int sqrt(int x).
 
     Compute and return the square root of x.
 
     x is guaranteed to be a non-negative integer.
 
 
     Example 1:
 
     Input: 4
     Output: 2
 
 
     Example 2:
 
     Input: 8
     Output: 2
     Explanation: The square root of 8 is 2.82842..., and since we want to return an integer, the decimal part will be truncated.
 */


/// 非负整数n的平方根总是不大于 n/2 的
func sqrtOfMine(_ n: Int) -> Int {
    var left = 0, right = n / 2;
    
    while left <= right {
        let middle = (left + right) / 2;
        
        let temp = middle * middle;
        if temp > n {
            right = middle - 1;
        } else if temp < n {
            left = middle + 1;
        } else {
            return middle;
        }
    }
    
    return right;
}


/// 牛顿迭代法
/*
 x ^ 2 = n;
 x = n / x;
 x = √n;
 √n = n / x;
 
 2x = x + √n;
 x = (x + √n) / 2;
 √n = (x + n / x) / 2;
 
 */
func sqrt(_ n: Int) -> Double {
    if n == 0 {
        return 0;
    }
    
    var result: Double = 8; // 这里随便取值都可以（若取负数，则结果也为负）
    var pre: Double = 0;
    while result != pre {
        pre = result;
        result = (result + Double(n) / result) / 2;
    }
    return result;
}


var i = 8;

sqrtOfMine(i);

sqrt(i);
