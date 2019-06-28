//: [Previous](@previous)

import Foundation

/*
 杨辉三角
 
 Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
 
 
 In Pascal's triangle, each number is the sum of the two numbers directly above it.
 
 Example:
 
 Input: 6
 Output:
 [
 [1],
 [1,1],
 [1,2,1],
 [1,3,3,1],
 [1,4,6,4,1],
 [1,5,10,10,5,1]
 ]
 */

func triangle(_ number: Int) -> Array<Array<Int>> {
    if number <= 0 {
        return [];
    }
    
    var result = Array<Array<Int>>();
    var curSub = [Int]();
    
    for i in 0..<number {
        if i == 0 {
            curSub = [1];
            
        } else {
            var preSub = result[i - 1];
            curSub = [preSub[0]];
            
            for (j, _) in preSub.enumerated() {
                if j == preSub.count - 1 {
                    curSub.append(1);
                } else {
                    curSub.append(preSub[j] + preSub[j + 1]);
                }
            }
        }
        result.append(curSub);
    }
    
    return result;
}

var result = triangle(10);
for item in result {
    print(item);
}
