//: [Previous](@previous)

import Foundation

/*
     You are climbing a stair case. It takes n steps to reach to the top.
 
     Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
     Note: Given n will be a positive integer.
 
 
     Example 1:
 
     Input: 2
     Output:  2
     Explanation:  There are two ways to climb to the top.
 
     1. 1 step + 1 step
     2. 2 steps
 
 
     Example 2:
 
     Input: 3
     Output:  3
     Explanation:  There are three ways to climb to the top.
 
     1. 1 step + 1 step + 1 step
     2. 1 step + 2 steps
     3. 2 steps + 1 step
 */


/// 动态规划
func climbStairsOfMine_Iteration(_ n: Int) -> Int {
    if n < 2 {
        return 1;
    }
    
    var pre = 1, cur = 1;
    
    for _ in 2...n {
        cur = pre + cur;
        pre = cur - pre;
    }
    
    return cur;
}


/// 普通递归
func climbStairsOfMine_Recursion(_ n: Int) -> Int {
    return n < 2 ? 1 : climbStairsOfMine_Recursion(n - 1) + climbStairsOfMine_Recursion(n - 2);
}


/// 使用字典保存的递归
var dic = [Int: Int]();
func climbStairsOfMine_Recursion_HashMap(_ n: Int) -> Int {
    if n < 2 {
        return 1;
    }
    
    if let value = dic[n] {
        return value;
    }
    
    dic[n] = climbStairsOfMine_Recursion_HashMap(n - 1) + climbStairsOfMine_Recursion_HashMap(n - 2);
    
    return dic[n]!;
}


/// 尾递归
func climbStairsOfMine_Recursion_Tail(_ n: Int, _ pre: Int = 1, _ cur: Int = 1) -> Int {
    if n < 2 {
        return cur;
    }
    
    var previous = pre, current = cur;
    
    current = previous + current;
    previous = current - previous;
    
    return climbStairsOfMine_Recursion_Tail(n - 1, previous, current);
}

var n = 9;

climbStairsOfMine_Iteration(n);

climbStairsOfMine_Recursion(n);

climbStairsOfMine_Recursion_HashMap(n);

climbStairsOfMine_Recursion_Tail(n);
