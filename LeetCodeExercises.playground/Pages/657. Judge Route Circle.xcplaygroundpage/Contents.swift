//: [Previous](@previous)

import Foundation

/*
     Initially, there is a Robot at position (0, 0). Given a sequence of its moves, judge if this robot makes a circle, which means it moves back to the original place.
 
     The move sequence is represented by a string. And each move is represent by a character. The valid robot moves are R (Right), L (Left), U (Up) and D (down). The output should be true or false representing whether the robot makes a circle.
 
     Example 1:
 
     Input: "UD"
     Output: true
 
     Example 2:
 
     Input: "LL"
     Output: false
 */


func judgeCircleOfMine(_ moves: String) -> Bool {
    let step = moves.uppercased();
    var isCircle = false;
    
    var dic = [Character: Int]();
    dic["L"] = 0;
    dic["R"] = 0;
    dic["U"] = 0;
    dic["D"] = 0;
    
    for c in step {
        dic[c]! += 1;
    }
    
    if dic["L"] == dic["R"] && dic["U"] == dic["D"] {
        isCircle = true;
    }
    
    return isCircle;
}


/// 别人的解法
func judgeCircle(_ moves: String) -> Bool {
    let step = moves.uppercased();
    
    var isCircle = false;
    var horizontal = 0, vertical = 0;
    
    for c in step {
        switch c {
        case "L":
            horizontal += 1;
        case "R":
            horizontal -= 1;
        case "U":
            vertical += 1;
        case "D":
            vertical -= 1;
        default:
            break;
        }
    }
    
    isCircle = horizontal == 0 && vertical == 0;
    
    return isCircle;
}


var str = "LRLUURDDLRU";

judgeCircleOfMine(str);

judgeCircle(str);
