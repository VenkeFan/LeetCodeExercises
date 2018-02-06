//: [Previous](@previous)

import Foundation

/*
     Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
     For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
 
           1
          / \
         2   2
        / \ / \
       3  4 4  3
 
     But the following [1,2,2,null,3,null,3] is not:
 
          1
         / \
        2   2
         \   \
          3   3
 
     Note:
     Bonus points if you could solve it both recursively and iteratively.
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
    public var array: [Element];
    
    public init() {
        self.array = [Element]();
    }
    
    public func isEmpty() -> Bool {
        return self.array.count == 0;
    }
    
    public func push(_ val: Element) {
        self.array.append(val);
    }
    
    public func pop() -> Element? {
        if self.isEmpty() {
            return nil;
        }
        
        return self.array.removeLast();
    }
}

public class Queue<Element> {
    public var array: [Element];
    
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

/***********************************************************/

/// 层次创建完全二叉树
func buildCompleteTreeInLevel(_ array: [Int]) -> TreeNode {
    let root = TreeNode.init(array[0]);
    
    let queue = Queue<TreeNode>.init();
    queue.enqueue(root);
    
    var index = 1;
    while !queue.isEmpty() {
        let tempNode = queue.dequeue();
        
        let left = index < array.count ? TreeNode.init(array[index]) : nil;
        let right = index + 1 < array.count ? TreeNode.init(array[index + 1]) : nil;
        
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

/// 思路是中序遍历
func isSymmetricOfMine_Recursion(_ root: TreeNode?) -> Void {
    if root != nil {
        isSymmetricOfMine_Recursion(root?.left);
        print("\(root!.val)");
        isSymmetricOfMine_Recursion(root?.right);
    }
}

func isSymmetricOfMine_Iteration(_ root: TreeNode?) -> Void {
    let stack = Stack<TreeNode>.init();
    var tempNode = root;

    while tempNode != nil || !stack.isEmpty() {
        if tempNode != nil {
            stack.push(tempNode!);
            tempNode = tempNode?.left;
        } else {
            tempNode = stack.pop();
            
            print("\(tempNode!.val)");
            tempNode = tempNode?.right;
        }
    }
}



/// 别人的解法

/*
 
// Recursive
public boolean isSymmetric(TreeNode root) {
    return root==null || isSymmetricHelp(root.left, root.right);
}

private boolean isSymmetricHelp(TreeNode left, TreeNode right){
    if(left==null || right==null)
    return left==right;
    if(left.val!=right.val)
    return false;
    return isSymmetricHelp(left.left, right.right) && isSymmetricHelp(left.right, right.left);
}

 
// Non-recursive
public boolean isSymmetric(TreeNode root) {
    if(root==null)  return true;
    
    Stack<TreeNode> stack = new Stack<TreeNode>();
    TreeNode left, right;
    if(root.left!=null){
        if(root.right==null) return false;
        stack.push(root.left);
        stack.push(root.right);
    }
    else if(root.right!=null){
        return false;
    }
    
    while(!stack.empty()){
        if(stack.size()%2!=0)   return false;
        right = stack.pop();
        left = stack.pop();
        if(right.val!=left.val) return false;
        
        if(left.left!=null){
            if(right.right==null)   return false;
            stack.push(left.left);
            stack.push(right.right);
        }
        else if(right.right!=null){
            return false;
        }
        
        if(left.right!=null){
            if(right.left==null)   return false;
            stack.push(left.right);
            stack.push(right.left);
        }
        else if(right.left!=null){
            return false;
        }
    }
    
    return true;
}
 
*/

var root = buildCompleteTreeInLevel([1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 5]);

isSymmetricOfMine_Iteration(root);
