//: [Previous](@previous)

import Foundation

/*
     Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 
     Note:
     You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2. The number of elements initialized in nums1 and nums2 are m and n respectively.
 */


func mergeOfMine(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = m - 1, j = n - 1;
    var k = m + n - 1;
    
    while i >= 0 && j >= 0 {
        if nums1[i] > nums2[j] {
            nums1[k] = nums1[i];
            i -= 1;
        } else {
            nums1[k] = nums2[j];
            j -= 1;
        }
        k -= 1;
    }
}

// 后面的-1的作用是让array1有足够的容量存array2的数据，不计入array1的实际长度
var array1: [Int] = [1, 5, 9, 13, 35, 123, -1, -1, -1, -1, -1];
var array2 = [3, 6, 15, 70, 188];

mergeOfMine(&array1, 6, array2, array2.count);

array1;
