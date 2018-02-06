//: [Previous](@previous)

import Foundation

/*
     Given two binary strings, return their sum (also a binary string).
 
     For example,
     a = "11"
     b = "1"
     Return "100".
 
 
    1   0001
    2   0010
    3   0011
    4   0100
    5   0101
    6   0110
    7   0111
    8   1000
    9   1001
 */

/// 数字相关的问题，解决方案首先考虑用数字操作的方法解决
func addBinaryOfMine(_ a: String, _ b: String) -> String {
    var sum = "";
    
    var i = a.count - 1, j = b.count - 1;
    var carryNum = 0;
    
    while i >= 0 || j >= 0 {
        var temp1 = 0, temp2 = 0;
        
        if i >= 0 {
            temp1 = Int(String.init(a[a.index(a.startIndex, offsetBy: i)]))!;
        }
        
        if j >= 0 {
            temp2 = Int(String.init(b[b.index(b.startIndex, offsetBy: j)]))!;
        }
        
        let tempSum: Int = temp1 + temp2 + carryNum;
        if tempSum < 2 {
            sum = String(tempSum) + sum;
            carryNum = 0;
        } else if tempSum == 2 {
            sum = "0" + sum;
            carryNum = 1;
        } else {
            sum = "1" + sum;
            carryNum = 1;
        }
        
        i -= 1;
        j -= 1;
    }
    
    if carryNum == 1 {
        sum = "1" + sum;
    }
    
    return sum;
}


/*
 
/// 别人的解法 (C++)
string addBinary(string a, string b)
{
    string s = "";
    
    int c = 0, i = a.size() - 1, j = b.size() - 1;
    while(i >= 0 || j >= 0 || c == 1)
    {
        c += i >= 0 ? a[i --] - '0' : 0;
        c += j >= 0 ? b[j --] - '0' : 0;
        s = char(c % 2 + '0') + s;
        c /= 2;
    }
    
    return s;
}
 
 */


var a = "11", b = "101";

addBinaryOfMine(a, b);
