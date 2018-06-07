//: Playground - noun: a place where people can play

import Cocoa

let volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

/*
func sortAscending(_ i: Int, _ j: Int) -> Bool
{
    return i < j
}

let volunteersSorted = volunteerCounts.sorted(by: sortAscending)
*/

/*
let volunteersSorted = volunteerCounts.sorted(by:
{
    (i: Int, j: Int) -> Bool in return i < j
})
*/

//let volunteersSorted = volunteerCounts.sorted(by: { i, j in i < j })
//let volunteersSorted = volunteerCounts.sorted(by: { $0 < $1 })
let volunteersSorted = volunteerCounts.sorted { $0 < $1 }
volunteersSorted
