//
//  main.swift
//  BinarySearchTree
//
//  Created by Michael Romero on 11/15/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

let bst: BinarySearchTree = BinarySearchTree()

bst.insert(5)
bst.insert(4)
bst.insert(7)
bst.insert(9)
bst.insert(2)
bst.insert(12)
bst.insert(3)

bst.printTree()

print()

print("BST contains 1 - \(bst.contains(1))")
print("BST contains -1 - \(bst.contains(-1))")

print("BST's minimum value is \(bst.findMin())")
print("BST's maximum value is \(bst.findMax())")
