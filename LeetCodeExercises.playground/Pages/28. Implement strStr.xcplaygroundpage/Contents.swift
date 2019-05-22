//: [Previous](@previous)

import Foundation

/*
     Implement strStr().
 
     Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 */


func strStrOfMine(_ haystack: String, _ needle: String) -> Int {
    var index = -1;
    
    if let range = haystack.range(of: needle) {
        if !range.isEmpty {
            index = haystack.distance(from:haystack.startIndex, to:range.lowerBound);
        }
    }
    
    return index;
}


func strStrOfMine_2(_ haystack: String, _ needle: String) -> Int {
    var index = -1;
    
    if haystack.count < needle.count {
        return index;
    }
    
    for i in 0..<haystack.count - needle.count + 1 {
        if haystack[haystack.index(haystack.startIndex, offsetBy: i)] == needle[needle.startIndex] {
            if haystack.count - i < needle.count {
                return index;
            }
            
            index = i;
            
            for j in 0..<needle.count {
                if haystack[haystack.index(haystack.startIndex, offsetBy: i + j)] != needle[needle.index(needle.startIndex, offsetBy: j)] {
                    index = -1;
                    break;
                }
            }
            
            if index != -1 {
                break;
            }
        }
    }
    
    return index;
}


/// 别人的解法
func strStr(_ haystack: String, _ needle: String) -> Int {
    var i = 0;
    while true {
        
        var j = 0;
        while true {
            if j == needle.count {
                return i;
            }
            if i + j == haystack.count {
                return -1;
            }
            if needle[needle.index(needle.startIndex, offsetBy: j)] != haystack[haystack.index(haystack.startIndex, offsetBy: i + j)] {
                break;
            }
            
            j += 1;
        }
        i += 1;
    }
}


var haystack = "hello, wworld"; // "hello, worl";
var needle = "world"; // "lo";

strStrOfMine(haystack, needle);

strStrOfMine_2(haystack, needle);

strStr(haystack, needle);
