//
//  QueueLinkedList.swift
//  StringList
//
//  Created by Michael Romero on 11/7/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

class QueueLinkedList {
    var head: Node!
    var tail: Node!
    
    init() {
        head = nil
        tail = nil
    }
    
    func enqueue(char: Character) {
        let newNode = Node(dat: char)
        if head == nil {
            head = newNode
            tail = newNode
        }
        else {
            tail.next = newNode
            tail = newNode
        }
    }
    
    func dequeue() -> Character {
        if head == nil {
            return " "
        }
        
        let result: Character = head.data
        if head === tail {
            head = nil
            tail = nil
        }
        else {
            head = head.next
        }
        return result
    }
    
    func front() -> Character {
        if head == nil {
            return " "
        }
        
        return head.data
    }
    
    func empty() -> Bool {
        return head == nil
    }
}
