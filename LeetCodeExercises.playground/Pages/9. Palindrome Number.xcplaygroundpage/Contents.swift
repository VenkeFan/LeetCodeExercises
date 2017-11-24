//: [Previous](@previous)

import Foundation

/*
     Determine whether an integer is a palindrome. Do this without extra space.
 
     回文：即是正读反读值都一样
 */


func isPalindromeOfMine(_ x: Int) -> Bool {
    if x < 0 || (x != 0 && x % 10 == 0) {
        return false;
    }
    
    var result = 0;
    var temp = x;
    
    while temp != 0 {
        result = result * 10 + temp % 10;
        temp /= 10;
    }
    
    return result == x;
}


var x = 102201;

isPalindromeOfMine(x);
