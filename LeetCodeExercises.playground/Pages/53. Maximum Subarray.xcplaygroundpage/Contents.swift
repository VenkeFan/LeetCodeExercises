//: [Previous](@previous)

import Foundation

/*
     Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
 
     For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
     the contiguous subarray [4,-1,2,1] has the largest sum = 6.
 */


func maxSubArrayOfMine(_ nums: [Int]) -> Int {
    var curSum: Int = 0;
    var maxSum: Int = 0;
    
    for value in nums {
        curSum += value;
        
        if curSum > maxSum {
            maxSum = curSum;
        } else if curSum < 0 {
            curSum = 0;
        }
    }
    
    return maxSum;
}


func max3(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if (a > c && a > b) {
        return a;
    } else if c > b {
        return c;
    } else {
        return b;
    }
}

func maxSubArrayOfDivideAndConquer(_ nums: [Int], _ left: Int, _ right: Int) -> (max: Int, left: Int, right: Int) {
    
    if left == right {
        return nums[left] < 0 ? (0, left, right) : (nums[left], left, right);
    }
    
    let middle = (left + right) / 2;
    
    let maxLeftSum = maxSubArrayOfDivideAndConquer(nums, left, middle);
    let maxRightSum = maxSubArrayOfDivideAndConquer(nums, middle + 1, right);
    
    //求出以左边对后一个数字结尾的序列最大值
    var maxLeftBorderSum = 0, leftBorderSum = 0;
    var subLeft = 0, subRight = 0;
    
    var i = middle;
    while i >= left {
        leftBorderSum += nums[i];
        if (leftBorderSum > maxLeftBorderSum) {
            maxLeftBorderSum = leftBorderSum;
            
            subLeft = i;
        }
        
        i -= 1;
    }
    
    //求出以右边对后一个数字结尾的序列最大值
    var maxRightBorderSum = 0, rightBorderSum = 0;
    
    for i in middle + 1...right {
        rightBorderSum += nums[i];
        if (rightBorderSum > maxRightBorderSum) {
            maxRightBorderSum = rightBorderSum;
            
            subRight = i;
        }
    }
    
    let maxSum = max3(maxLeftSum.max, maxRightSum.0,
                   maxLeftBorderSum + maxRightBorderSum);
    
    // 获取最大值区间
    if maxSum == maxLeftSum.max {
        subLeft = maxLeftSum.left;
        subRight = maxLeftSum.right;
    } else if maxSum == maxRightSum.max {
        subLeft = maxRightSum.left;
        subRight = maxRightSum.right;
    } else {
        
    }
    
    return (maxSum, subLeft, subRight);
}


var array = [-2,1,-3,4,-1,2,1,-5,4]; // [-6, 2, 4, -7, 5, 3, 2, -1, 6, -9, 10, -2];

maxSubArrayOfMine(array);

maxSubArrayOfDivideAndConquer(array, 0, array.count - 1);

