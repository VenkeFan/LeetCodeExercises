//: [Previous](@previous)

import Foundation

/*
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
 
 Note that you cannot sell a stock before you buy one.
 
 Example 1:
 
 Input: [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Not 7-1 = 6, as selling price needs to be larger than buying price.
 
 Example 2:
 
 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 */


/// 这个方法也找到了最佳利润的买卖那天的下标
func solutionOfMine(_ array: [Int]) -> (Int, Int) {
    var buy = 0, sell = 0;
    var maxProfit = 0;
    var index1 = -1;
    var index2 = -1;
    
    for _ in 0..<array.count - 1 {
        let cur = array[sell] - array[buy];
        if cur > maxProfit {
            maxProfit = cur;
            index1 = buy;
            index2 = sell;
            sell += 1;
        } else if array[sell] < array[buy] {
            buy = sell;
            sell = buy + 1;
        } else {
            sell += 1;
        }
    }
    
    return (index1, index2);
}


/// 求最大利润
func solution(_ prices: [Int]) -> Int {
    var minprice = Int.max;
    var maxprofit = 0;
    
    for i in 0..<prices.count {
        if (prices[i] < minprice) {
            minprice = prices[i];
        } else if (prices[i] - minprice > maxprofit) {
            maxprofit = prices[i] - minprice;
        }
        
    }
    
    return maxprofit;
}

var array = [7,2,9,6,1,3];
//array = [7,1,5,3,6,4];
//array = [7,6,4,3,1];

//solutionOfMine(array);
solution(array);
