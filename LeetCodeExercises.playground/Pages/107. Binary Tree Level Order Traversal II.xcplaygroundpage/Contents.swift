//: [Previous](@previous)

import Foundation

/*
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
    3
   / \
  9  20
    /  \
   15   7
 return its bottom-up level order traversal as:
 [
    [15,7],
    [9,20],
    [3]
 ]
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
    
    public func enqueue(_ val: Element?) {
        if let temp = val {
            self.array.append(temp);
        }
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

func levelTraversal(_ root: TreeNode?) {
    let q = Queue<TreeNode>();
    
    q.enqueue(root);
    
    while (!q.isEmpty()) {
        let node = q.dequeue();
        if let temp = node {
            print(temp.val, separator: "", terminator: ",");
            
            q.enqueue(temp.left);
            q.enqueue(temp.right);
        }
    }
}

func levelTraversalLine(_ root: TreeNode?) {
    let q = Queue<TreeNode>();
    let q2 = Queue<TreeNode>();
    
    q.enqueue(root);
    
    while (!q.isEmpty() || !q2.isEmpty()) {
        while (!q.isEmpty()) {
            if let temp = q.dequeue() {
                print(temp.val, separator: "", terminator: ",");
                
                q2.enqueue(temp.left);
                q2.enqueue(temp.right);
            }
        }
        print("\n", separator: "", terminator: "");
        
        while (!q2.isEmpty()) {
            if let temp = q2.dequeue() {
                print(temp.val, separator: "", terminator: ",");
                
                q.enqueue(temp.left);
                q.enqueue(temp.right);
            }
        }
        print("\n", separator: "", terminator: "");
    }
}

func binTreeTraversal_Recursion(_ root:TreeNode?) {
    if let temp = root {
        print(temp.val); // 先序
        binTreeTraversal_Recursion(temp.left);
//        print(temp.val); // 中序
        binTreeTraversal_Recursion(temp.right);
//        print(temp.val); // 后序
    }
}

func preorderTraversal_Iteration(_ root:TreeNode?) {
    let s = Stack<TreeNode>();
    var node : TreeNode? = root;
    
    while (nil != node || !s.isEmpty()) {
        if let temp = node {
            s.push(temp);
            print(temp.val); // 先序
            node = node?.left;
        } else {
            node = s.pop();
//            print(node?.val as Any); // 中序
            node = node?.right;
        }
    }
}

/***********************************************************/

var root = buildBinaryTreeInLevel([3, 9, 20, 1, 2, 15, 7]);

//levelTraversal(root);
levelTraversalLine(root);
//binTreeTraversal_Recursion(root);
//preorderTraversal_Iteration(root);
