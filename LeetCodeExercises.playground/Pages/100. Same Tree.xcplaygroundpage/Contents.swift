//: [Previous](@previous)

import Foundation

/*
     Given two binary trees, write a function to check if they are the same or not.
 
     Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
 
 
     Example 1:
 
     Input:     1         1
               / \       / \
              2   3     2   3
 
     [1,2,3],   [1,2,3]
 
     Output: true
 
 
     Example 2:
 
     Input:     1         1
               /           \
              2             2
 
     [1,2],     [1,null,2]
 
     Output: false
 
 
     Example 3:
 
     Input:     1         1
               / \       / \
              2   1     1   2
 
     [1,2,1],   [1,1,2]
 
     Output: false
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

/***********************************************************/


func isSameTreeOfMine_1(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    print("isSameTreeOfMine_1");
    if p?.left == nil && p?.right == nil && q?.left == nil && q?.right == nil {
        return p?.val == q?.val;
    }

    return isSameTreeOfMine_1(p?.left, q?.left) && isSameTreeOfMine_1(p?.right, q?.right);
}


func isSameTreeOfMine_2(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    print("isSameTreeOfMine_2");
    if p == nil && q == nil {
        return true;
    }
    
    if  p == nil || q == nil {
        return false;
    }
    
    return p?.val == q?.val && isSameTreeOfMine_2(p?.left, q?.left) && isSameTreeOfMine_2(p?.right, q?.right);
}


var tree1 = TreeNode.init(1);
tree1.left = TreeNode.init(2);
tree1.right = TreeNode.init(3);

var tree2 = TreeNode.init(1);
tree2.left = TreeNode.init(2);
tree2.right = TreeNode.init(3);

isSameTreeOfMine_1(tree1, tree2);
isSameTreeOfMine_2(tree1, tree2);


