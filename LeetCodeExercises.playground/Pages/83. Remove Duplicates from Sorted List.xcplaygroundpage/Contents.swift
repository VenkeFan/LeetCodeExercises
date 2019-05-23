//: [Previous](@previous)

import Foundation

/*
     Given a sorted linked list, delete all duplicates such that each element appear only once.
 
     For example,
     Given 1->1->2, return 1->2.
     Given 1->1->2->3->3, return 1->2->3.
 */


public class ListNode {
    public var val: Int;
    public var next: ListNode?;
    public init(_ val: Int) {
        self.val = val;
        self.next = nil;
    }
}

/***********************************************************/


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


func deleteDuplicatesOfMine(_ head: ListNode?) -> ListNode? {
    let newNode: ListNode? = head;
    var preNode: ListNode? = nil, currentNode = head;
    
    while currentNode != nil {
        if currentNode?.val == preNode?.val {
            let tempNode = currentNode;
            preNode?.next = tempNode?.next;
            tempNode?.next = nil;
            
            currentNode = preNode?.next;
        } else {
            preNode = currentNode;
            
            currentNode = currentNode?.next;
        }
    }
    
    return newNode;
}


/// 别人的解法（递归）
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head;
    }
    
    head?.next = deleteDuplicates(head?.next);
    return head?.val == head?.next?.val ? head?.next : head;
}


var originalNode = initializeListNode([1, 2, 3, 4, 4]);

var newNode = deleteDuplicatesOfMine(originalNode);

var tempNode = newNode;
while tempNode != nil {
    print("\(String(describing: tempNode?.val))");
    tempNode = tempNode?.next;
}
