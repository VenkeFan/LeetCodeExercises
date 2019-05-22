//: [Previous](@previous)

import Foundation

/*
     Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
 
     If the last word does not exist, return 0.
 
     Note: A word is defined as a character sequence consists of non-space characters only.
 
     Example:
 
     Input: "Hello World"
     Output: 5
 */


func lengthOfLastWordOfMine(_ s: String) -> Int {
    var length = 0, index = s.count - 1;
    
    while index >= 0 {
        if s[s.index(s.startIndex, offsetBy: index)] == " " {
            index -= 1;
        } else {
            break;
        }
    }
    
    while index >= 0 {
        if s[s.index(s.startIndex, offsetBy: index)] == " " {
            break;
        }
        
        length += 1;
        index -= 1;
    }
    
    return length;
}


/// 别人的解法
func lengthOfLastWord(_ s: String) -> Int {
    var length = 0, index = s.count - 1;
    
    while index >= 0 && s[s.index(s.startIndex, offsetBy: index)] == " " {
        index -= 1;
    }
    
    while index >= 0 && s[s.index(s.startIndex, offsetBy: index)] != " " {
        length += 1;
        index -= 1;
    }
    
    return length;
}

var str = "Hi World   ";

lengthOfLastWordOfMine(str);

lengthOfLastWord(str);
