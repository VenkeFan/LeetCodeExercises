//: [Previous](@previous)

import Foundation

/*
     The count-and-say sequence is the sequence of integers with the first five terms as following:
 
     1).     1
     2).     11
     3).     21
     4).     1211
     5).     111221
     1 is read off as "one 1" or 11.
     11 is read off as "two 1s" or 21.
     21 is read off as "one 2, then one 1" or 1211.
     Given an integer n, generate the nth term of the count-and-say sequence.
 
     Note: Each term of the sequence of integers will be represented as a string.
 
     Example 1:
 
         Input: 1
         Output: "1"
 
 
     Example 2:
 
         Input: 4
         Output: "1211"
 
     Example:
     6): 312211
     7): 13112221
     8): 1113213211
     9): 31131211131221
 */


func countAndSayOfMine_Recursion(_ n: Int) -> String {
    if n < 1 {
        return "";
    }
    
    if n == 1 {
        return "1";
    }
    
    let preStr = countAndSayOfMine_Recursion(n - 1);
    var count = 1;
    var curStr = "";
    
    for i in 0..<preStr.count {
        if i < preStr.count - 1 {
            if preStr[preStr.index(preStr.startIndex, offsetBy: i)] == preStr[preStr.index(preStr.startIndex, offsetBy: i + 1)] {
                count += 1;
            } else {
                curStr.append("\(count)" + "\(preStr[preStr.index(preStr.startIndex, offsetBy: i)])");
                
                count = 1;
            }
        } else  {
            curStr.append("\(count)" + "\(preStr[preStr.index(preStr.startIndex, offsetBy: i)])");
        }
    }
    
    return curStr;
}


func countAndSayOfMine_Iteration(_ n: Int) -> String {
    if n < 1 {
        return "";
    }
    
    if n == 1 {
        return "1";
    }
    
    var preStr = "1";
    var count = 1;
    var curStr = "";
    
    for _ in 2...n {
        count = 1;
        curStr = "";
        
        for i in 0..<preStr.count {
            if i < preStr.count - 1 {
                if preStr[preStr.index(preStr.startIndex, offsetBy: i)] == preStr[preStr.index(preStr.startIndex, offsetBy: i + 1)] {
                    count += 1;
                } else {
                    curStr.append("\(count)" + "\(preStr[preStr.index(preStr.startIndex, offsetBy: i)])");
                    
                    count = 1;
                }
            } else  {
                curStr.append("\(count)" + "\(preStr[preStr.index(preStr.startIndex, offsetBy: i)])");
            }
        }
        
        preStr = curStr;
    }
    
    return curStr;
}


/// 别人的解法
func countAndSay(_ n: Int) -> String {
    if n < 1 {
        return "";
    }
    var prev = "1";
    
    for _ in 2...n {
        var curChar = prev[prev.startIndex];
        var times = 1;//curChar 出现的次数
        var tmpstr = "";
        prev.append("#");//处理边界条件
        
        for k in 1..<prev.count {
            if(prev[prev.index(prev.startIndex, offsetBy: k)] == curChar) {
                times += 1;
            } else {
                tmpstr.append("\(times)");
                tmpstr.append(curChar);
                curChar = prev[prev.index(prev.startIndex, offsetBy: k)];
                times = 1;
            }
        }
        
        prev = tmpstr;
    }
    
    
    return prev;
}


var i = 5;

countAndSayOfMine_Recursion(i);

countAndSayOfMine_Iteration(i);

countAndSay(i);

