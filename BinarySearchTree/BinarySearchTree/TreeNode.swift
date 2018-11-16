//
//  TreeNode.swift
//  BinarySearchTree
//
//  Created by Michael Romero on 11/15/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var data: Int!
    
    init() {
        left = nil
        right = nil
        data = 0
    }
    
    init(_ dat: Int, _ lef: TreeNode, _ rig: TreeNode) {
        data = dat
        left = lef
        right = rig
    }
}
