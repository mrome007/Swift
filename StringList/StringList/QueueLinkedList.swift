//
//  QueueLinkedList.swift
//  StringList
//
//  Created by Michael Romero on 11/7/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

class QueueLinkedList {
    var head: Node?
    var tail: Node?
    
    init() {
        head = nil
        tail = nil
    }
    
    func enqueue(char: Character) {
        let newNode = Node(dat: char)
        if let _ = head, let t = tail {
            t.next = newNode
            tail = newNode
        }
        else {
            head = newNode
            tail = newNode
        }
    }
    
    func dequeue() -> Character {
        if let h = head {
            let result: Character = h.data
            if head === tail {
                head = nil
                tail = nil
            }
            else {
                head = h.next
            }
            return result
        }
        else {
            return " "
        }
    }
    
    func front() -> Character {
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
