//: [Previous](@previous)

import Foundation

/*
 Given a binary tree, find its maximum depth.
 
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given binary tree [3,9,20,null,null,15,7],
 
   3
  / \
 9  20
   /  \
  15   7
 return its depth = 3.
 */

public class TreeNode {
    public var val: Int;
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val;
        self.left = nil;
        self.right = nil;
    }
}

public class Stack<Element> {
    private var array: [Element];
    
    public init() {
        self.array = [Element]();
    }
    
    public func isEmpty() -> Bool {
        return self.array.count == 0;
    }
    
    public func push(_ val: Element?) {
        if let temp = val {
            self.array.append(temp);
        }
    }
    
    public func pop() -> Element? {
        if self.isEmpty() {
            return nil;
        }
        
        return self.array.removeLast();
    }
}

public class Queue<Element> {
    private var array: [Element];
    
    public init() {
        self.array = [Element]();
    }
    
    public func isEmpty() -> Bool {
        return self.array.count == 0;
    }
    
    public func enqueue(_ val: Element) {
        self.array.append(val);
    }
    
    public func dequeue() -> Element? {
        if self.isEmpty() {
            return nil;
        }
        
        return self.array.removeFirst();
    }
}

func buildBinaryTreeInLevel(_ array: [Int]) -> TreeNode {
    let root = TreeNode.init(array[0]);
    
    let queue = Queue<TreeNode>.init();
    queue.enqueue(root);
    
    var index = 1;
    while !queue.isEmpty() {
        let tempNode = queue.dequeue();
        
        let left = index < array.count && array[index] >= 0 ? TreeNode.init(array[index]) : nil;
        let right = index + 1 < array.count && array[index + 1] >= 0 ? TreeNode.init(array[index + 1]) : nil;
        
        tempNode?.left = left;
        tempNode?.right = right;
        
        if left != nil {
            queue.enqueue(left!);
        }
        
        if right != nil {
            queue.enqueue(right!);
        }
        
        index += 2;
    }
    
    return root;
}

/***********************************************************/

func maxDepth_Recursion(_ root: TreeNode?) ->Int {
    if nil == root {
        return 0;
    }
    
    if nil == root?.left && nil == root?.right {
        return 1;
    }
    
    let leftDepth = maxDepth_Recursion(root?.left);
    let rightDepth = maxDepth_Recursion(root?.right);
    
    return leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1;
}

func maxDepth_Iteration(_ root: TreeNode?) ->Int {
    if nil == root {
        return 0;
    }
    
    if nil == root?.left && nil == root?.right {
        return 1;
    }
    
    var depth = 0;
    
    let s1 = Stack<TreeNode>();
    s1.push(root!);
    
    let s2 = Stack<TreeNode>();
    
    while (!s1.isEmpty() || !s2.isEmpty()) {
        depth += 1;
        while (!s1.isEmpty()) {
            if let temp = s1.pop() {
                s2.push(temp.left);
                s2.push(temp.right);
            }
        }
        
        while (!s2.isEmpty()) {
            if let temp = s2.pop() {
                s1.push(temp.right);
                s1.push(temp.left);
            }
        }
    }
    
    return depth + 1;
    
    
//    while (!s1.isEmpty() || !s2.isEmpty()) {
//        if (depth & 1 == 0) {
//            while (!s1.isEmpty()) {
//                if let temp = s1.pop() {
//                    s2.push(temp.left);
//                    s2.push(temp.right);
//                }
//            }
//            depth += 1;
//        } else {
//            while (!s2.isEmpty()) {
//                if let temp = s2.pop() {
//                    s1.push(temp.right);
//                    s1.push(temp.left);
//                }
//            }
//            depth += 1;
//        }
//    }
//
//    return depth;
}

var root = buildBinaryTreeInLevel([3, 9, 20, -1, -1, 15, 7]);

maxDepth_Recursion(root);

maxDepth_Iteration(root);
