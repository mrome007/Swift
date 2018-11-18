//
//  DoublyLinkedList.swift
//  DoublyLinkedList
//
//  Created by Michael Romero on 11/18/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

class DoublyLinkedList {
    var head: Node?
    var tail: Node?
    var size: Int
    
    init() {
        head = nil
        tail = nil
        size = 0
    }
    
    func insert(_ data: Int) {
        let newNode: Node = Node(data, nil, nil)
        size += 1
        
        if let h = head, let t = tail {
            t.next = newNode
            newNode.next = h
            newNode.prev = t
            tail = newNode
            h.prev = tail
        }
        else {
            head = newNode
            tail = newNode
            
            newNode.next = head
            newNode.prev = tail
        }
    }
    
    func remove(_ cur: Node?) {
        if let h = head, let t = tail {
            if let c = cur {
                size -= 1
                
                if h === t {
                    head = nil
                    tail = nil
                    return
                }
                
                let next: Node! = c.next
                let prev: Node! = c.prev
                
                if c === head {
                    head = next
                }
                
                if c === tail {
                    tail = prev
                }
                
                prev.next = next
                next.prev = prev
            }
        }
    }
    
    func printList() {
        if var cur = head, let end = tail {
            
            while true {
                
                let data: Int = cur.data
                print(data)
                
                if cur === end {
                    break
                }
                
                cur = cur.next
            }
        }
    }
}
