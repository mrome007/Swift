//
//  Node.swift
//  DoublyLinkedList
//
//  Created by Michael Romero on 11/18/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

class Node {
    public var prev: Node!
    public var next: Node!
    public var data: Int
    
    init() {
        prev = nil
        next = nil
        data = 0
    }
    
    init(_ dat: Int, _ nex: Node?, _ pre: Node?) {
        prev = pre
        next = nex
        data = dat
    }
}
