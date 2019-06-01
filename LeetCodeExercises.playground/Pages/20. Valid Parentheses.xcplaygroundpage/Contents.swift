//: [Previous](@previous)

import Foundation

/*
     Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
     
     The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
 */


/// 维护一个栈。
/// 遍历字符串，遇到左括号入栈，遇到右括号则和栈顶元素比较，是匹配的话则出栈，否则直接返回 false。最后判断栈是否为空
func isValidOfMine(_ str: String) -> Bool {
    if str.count & 1 != 0 {
        return false;
    }
    
    var stack: [Character] = [Character]();
    
    for c in str {
        switch c {
        case "(", "[", "{":
            stack.append(c);
        case ")", "]", "}":
            let temp = stack.last!;
            if isPairParentheses(temp, c) {
                stack.removeLast();
            } else {
                return false;
            }
        default:
            return false;
        }
    }
    
    return stack.isEmpty;
}

func isPairParentheses(_ left: Character, _ right: Character) -> Bool {
    switch left {
    case "(":
        return right == ")";
    case "[":
        return right == "]";
    case "{":
        return right == "}";
    default:
        return false;
    }
}


var str = "(()([])[]{}{})";

isValidOfMine(str);
