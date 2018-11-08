//
//  StackLinkedList.swift
//  StringList
//
//  Created by Michael Romero on 11/7/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

class StackLinkedList{
    var head: Node!
    
    init() {
        head = nil
    }
    
    func push(char: Character) {
        let newNode = Node(dat: char)
        if head == nil {
            head = newNode
            return
        }
        
        newNode.next = head
        head = newNode
    }
    
    func pop() -> Character {
        if head == nil {
            return " "
        }
        
        let result: Character = head.data
        head = head.next
        return result
    }
    
    func top() -> Character {
        if head == nil {
            return " "
        }
        
        return head.data
    }
    
    func empty() -> Bool {
        return head == nil
    }
}
