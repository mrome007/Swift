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
    
    private func printTree(_ node: TreeNode?) {
        if let n = node {
            printTree(n.left)
            let num: Int = n.data
            print(num)
            printTree(n.right)
        }
    }
    
    public func printTree() {
        printTree(root)
    }
    
    private func contains(_ node: TreeNode?, _ data: Int) -> Bool {
        if let n = node {
            if n.data == data {
                return true
            }
            else if data < n.data {
                return contains(n.left, data)
            }
            else {
                return contains(n.right, data)
            }
        }
        else {
            return false
        }
    }
    
    public func contains(_ data: Int) -> Bool {
        return contains(root, data)
    }
    
    private func findMin(_ node: TreeNode?) -> Int {
        if let n = node {
            if let nleft = n.left {
                return findMin(nleft)
            }
            else {
                return n.data
            }
        }
        
        return -1
    }
    
    public func findMin() -> Int {
        return findMin(root)
    }
    
    private func findMax(_ node: TreeNode?) -> Int {
        if let n = node {
            if let nRight = n.right {
                return findMax(nRight)
            }
            else {
                return n.data
            }
        }
        
        return -1
    }
    
    public func findMax() -> Int {
        return findMax(root)
    }
    
    private func findMin(_ node: TreeNode?) -> TreeNode? {
        if let n = node {
            if let nleft = n.left {
                return findMin(nleft)
            }
            else {
                return n
            }
        }
        
        return nil
    }
    
    public func findMinNode() -> TreeNode? {
        return findMin(root)
    }
    
    private func findMax(_ node: TreeNode?) -> TreeNode? {
        if let n = node {
            if let nRight = n.right {
                return findMax(nRight)
            }
            else {
                return n
            }
        }
        
        return nil
    }
    
    public func findMaxNode() -> TreeNode? {
        return findMax(root)
    }
}
