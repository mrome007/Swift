//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by Michael Romero on 11/15/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

class BinarySearchTree {
    var root: TreeNode?
    
    init() {
        root = nil
    }
    
    private func insert(_ node: inout TreeNode? , _ data: Int) {
        if let n = node {
            if data < n.data {
                insert(&n.left, data)
            }
            else if data > n.data {
                insert(&n.right, data)
            }
        }
        else {
            node = TreeNode(data, nil, nil)
        }
    }
    
    public func insert(_ data: Int) {
        insert(&root, data)
    }
    
    private func printTree(_ node: inout TreeNode?) {
        if let n = node {
            printTree(&n.left)
            let num: Int = n.data
            print(num)
            printTree(&n.right)
        }
    }
    
    public func printTree() {
        printTree(&root)
    }
}
