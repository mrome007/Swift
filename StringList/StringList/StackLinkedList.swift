//
//  StackLinkedList.swift
//  StringList
//
//  Created by Michael Romero on 11/7/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

class StackLinkedList{
    var head: Node?
    
    init() {
        head = nil
    }
    
    func push(char: Character) {
        let newNode = Node(dat: char)
        if let h = head {
            newNode.next = h
            head = newNode
        }
        else {
            head = newNode
        }
    }
    
    func pop() -> Character {
        if let h = head {
            let result: Character = h.data
            head = h.next
            return result
        }
        else {
            return " "
        }
    }
    
    func top() -> Character {
        if let h = head {
            return h.data
        }
        else {
            return " "
        }
    }
    
    func empty() -> Bool {
        return head == nil
    }
}
