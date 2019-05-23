//: [Previous](@previous)

import Foundation

/*
     汉明距离：求两个整数的二进制数之间相同位置上的值不同的数量
 
     Input: x = 1, y = 4
 
     Output: 2
 
     Explanation:
     1   (0 0 0 1)
     4   (0 1 0 0)
            ↑   ↑
 
     The above arrows point to positions where the corresponding bits are different.
 */

func hammingDistanceOfMine(x: Int, y: Int) -> Int {
    var dist = 0;
    let str = String(x ^ y, radix:2);
    
    for c in str {
        if c == "1" {
            dist += 1;
        }
    }
    
    return dist;
}

func hammingDistance_2(x: Int, y: Int) -> Int {
    var dist = 0, n = x ^ y;
    for i in 0..<32 {
        if (n >> i) == 0 {
            break;
        }
        dist += (n >> i) & 1;
    }
    
    return dist;
}


/// 别人的解法
func hammingDistance(x: Int, y: Int) -> Int {
    var dist = 0;
    
    var n = x ^ y;
    
    while n > 0 {
        dist += 1;
        n &= (n - 1);
    }
    
    return dist;
}


var x = 1, y = 4;

hammingDistanceOfMine(x: x, y: y);

hammingDistance_2(x: x, y: y);

hammingDistance(x: x, y: y);

