//: [Previous](@previous)

import Foundation

/*
     Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 */


public class ListNode {
    public var val: Int;
    public var next: ListNode?;
    public init(_ val: Int) {
        self.val = val;
        self.next = nil;
    }
}


func initializeListNode(_ array: [Int]) -> ListNode? {
    let headNode = ListNode.init(array[0]);
    var tmpNode = headNode;
    
    for i in 1..<array.count {
        let node = ListNode.init(array[i]);
        tmpNode.next = node;
        tmpNode = node;
    }
    
    return headNode;
}


func mergeTwoListsOfMine(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var node1 = l1, node2 = l2;
    var newNode: ListNode? = nil;
    var preNode: ListNode?;
    
    while node1 != nil && node2 != nil {
        
        var tmpNode: ListNode?;
        if node1!.val < node2!.val {
            tmpNode = node1;
            node1 = node1?.next;
        } else {
            tmpNode = node2;
            node2 = node2?.next;
        }
        
        if newNode == nil {
            newNode = tmpNode;
            preNode = newNode;
        } else {
            preNode?.next = tmpNode;
            preNode = tmpNode;
        }
    }
    
    if node1 != nil {
        preNode?.next = node1;
    } else if node2 != nil {
        preNode?.next = node2;
    }
    
    return newNode;
}


/// 别人的解法（不是尾递归，如果数据过多，会栈溢出）
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2;
    }
    if l2 == nil {
        return l1;
    }
    
    var mergeHead: ListNode?;
    if l1!.val < l2!.val {
        mergeHead = l1;
        mergeHead?.next = mergeTwoLists(l1?.next, l2);
    } else {
        mergeHead = l2;
        mergeHead?.next = mergeTwoLists(l2?.next, l1);
    }
    
    return mergeHead;
}


var node1 = initializeListNode([1, 5, 9, 13, 35, 123]);
var node2 = initializeListNode([3, 6, 15, 70, 188]);

var newNode = mergeTwoListsOfMine(node1, node2);

var node = newNode;
while node != nil {
    print("\(String(describing: node?.val))");
    node = node?.next;
}

