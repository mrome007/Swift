//
//  main.swift
//  DoublyLinkedList
//
//  Created by Michael Romero on 11/18/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

/*
 Josephus Problem: N people numbered 1 to N, are sitting in a circle. Starting
 at person 1, a hot potato is passed. After M passes, the person holding the
 hot potato is eliminated, the circle closes ranks, and the game continues with
 the person who was sitting after the eliminated person picking up the hot potato.
 The last remaining person wins. Thus, if M = 0 and N = 5, players are eliminated
 in order, and player 5 wins. If M = 1 and N = 5, the order of elimination is
 2, 4, 1, 5 and player 3 wins.
 
 a. Write a program to solve the Josephus problem for general values of M and N.
 Try to make your program as efficient as possible. Make sure you dispose of cells.
 b. What is the running time of your program?
 c. If M = 1, what is the running time of your program? How is the actual speed
 affectd by the delete routine for large values of N(N > 100,000)
 */

let ds: DoublyLinkedList = DoublyLinkedList()

ds.insert(1)
ds.insert(2)
ds.insert(3)
ds.insert(1)
ds.insert(2)
ds.insert(3)

ds.printList()

ds.remove(ds.head)
print()
ds.printList()
