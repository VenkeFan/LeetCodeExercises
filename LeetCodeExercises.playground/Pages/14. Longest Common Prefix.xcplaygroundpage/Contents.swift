//: [Previous](@previous)

import Foundation

/*
     Write a function to find the longest common prefix string amongst an array of strings.
 */


/*
 1. 将字符串数组按照长度排序
 2. 将长度最短的项和其他项逐一比较是否有公用前缀，如没有则将最短项的末字符剔除，直到最短项长度为0。
 */
func longestCommonPrefixOfMine_1(_ strs: [String]) -> String? {
    var sortedStrs = strs.sorted { (str1, str2) -> Bool in
        return str1.count < str2.count;
    }
    
    var commonPrefix = sortedStrs[0];
    
    for index in 1..<sortedStrs.count {
        if commonPrefix.isEmpty {
            return nil;
        }
        
        if !sortedStrs[index].hasPrefix(commonPrefix) {
            commonPrefix.removeLast();
        }
    }
    
    return commonPrefix;
}


/*
     解法二
     无需排序，先比较数组中前两元素，得到二者的公用前缀，再用该前缀和其他项逐一比较。
 */
func longestCommonPrefixOfMine_2(_ strs: [String]) -> String? {
    var commonPrefix = strs[0];
    
    for index in 1..<strs.count {
        if commonPrefix.isEmpty {
            return nil;
        }
        
        commonPrefix = longestCommonPrefix(commonPrefix, strs[index]);
    }
    
    return commonPrefix;
}


func longestCommonPrefix(_ str1: String, _ str2: String) -> String {
    var shorter: String, longer: String;
    
    if str1.count < str2.count {
        shorter = str1;
        longer = str2;
    } else {
        shorter = str2;
        longer = str1;
    }
    
    while shorter.count > 0 {
        if !longer.hasPrefix(shorter) {
            shorter.removeLast();
        } else {
            break;
        }
    }
    
    return shorter;
}


/// 别人的解法（将字符串数组按字母排序，然后只需比较排序后的首、尾两项）
func longestCommonPrefixOfOther(_ strs: [String]) -> String? {
    var sortedStrs = strs.sorted();
    
    let commonPrefix = longestCommonPrefix(sortedStrs[0], sortedStrs[sortedStrs.count - 1]);
    
    return commonPrefix;
}


var strs: [String] = ["abcdesdf", "abced", "abc", "abge", "abcfed"];

longestCommonPrefixOfMine_1(strs);

longestCommonPrefixOfMine_2(strs);

longestCommonPrefixOfOther(strs);


