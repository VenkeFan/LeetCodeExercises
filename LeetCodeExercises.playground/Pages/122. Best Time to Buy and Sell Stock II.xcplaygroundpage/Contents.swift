//: [Previous](@previous)

import Foundation

/*
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
 
 Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).
 
 Example 1:
 
 Input: [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
 Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 
 Example 2:
 
 Input: [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
 engaging multiple transactions at the same time. You must sell before buying again.
 
 Example 3:
 
 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 */

func solutionOfMine(_ array: [Int]) -> Int {
    var buy = 0, sell = 0;
    var maxProfit = 0;
    
    for i in 0..<array.count {
        let profit = array[sell] - array[buy];
        if profit > 0 {
            maxProfit += profit;
            buy = i;
            sell += 1;
        } else {
            buy = sell;
            sell = buy + 1;
        }
    }
    
    return maxProfit;
}

func solution(_ prices: [Int]) -> Int {
    var i = 0;
    var valley = prices[0];
    var peak = prices[0];
    var maxprofit = 0;
    while (i < prices.count - 1) {
        while (i < prices.count - 1 && prices[i] >= prices[i + 1]) {
            i += 1;
        }
        valley = prices[i];
        while (i < prices.count - 1 && prices[i] <= prices[i + 1]) {
            i += 1;
        }
        peak = prices[i];
        maxprofit += peak - valley;
    }
    return maxprofit;
}

var array = [7,2,9,6,1,3];
array = [7,1,5,3,6,4];
array = [7,6,4,3,1];

solutionOfMine(array);
solution(array);
