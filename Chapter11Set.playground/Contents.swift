//: Playground - noun: a place where people can play

import Cocoa

var groceryBag: Set = ["Apples", "Oranges", "Pineapple"]


for food in groceryBag
{
    print(food)
}

let hasBananas = groceryBag.contains("Bananas")

let friendsGroceryBag: Set = ["Bananas", "Cereal", "Milk", "Oranges"]
let commonGroceryBag = groceryBag.union(friendsGroceryBag)

let roommatesGroceryBag: Set = ["Apples", "Bananas", "Cereal", "Toothpaste"]
let itermsToReturn = commonGroceryBag.intersection(roommatesGroceryBag)

let yourSecondBag: Set = ["Berries", "Yogurt"]
let roommatesSecondBag: Set = ["Grapes", "Honey"]
let disjoint = yourSecondBag.isDisjoint(with: roommatesSecondBag)

let myCitites = Set(["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco"])
let yourCities = Set(["Chicago", "San Francisco", "Los Angeles"])
let containsAllCities = myCitites.isSuperset(of: yourCities)
