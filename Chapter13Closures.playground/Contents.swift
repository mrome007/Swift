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

/*
func makeTownGrand() -> (Int, Int) -> Int{
    func buildRoads(byAddingLights lights: Int,
                    toExistingLights existingLights: Int) -> Int{
        return lights + existingLights
    }
    return buildRoads
}

var stopLights = 4
let townPlanByAddingLightsToExistingLights = makeTownGrand()
stopLights = townPlanByAddingLightsToExistingLights(4, stopLights)
print("Knowhere has \(stopLights) stoplights.")
*/

func makeTownGrand(withBudget budget: Int,
                   condition: (Int) -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget){
        func buildRoads(byAddingLights lights: Int,
                        toExistingLights existingLights: Int) -> Int {
            return lights + existingLights
        }
        return buildRoads
    }else {
            return nil
    }
}

func evaluate(budget: Int) -> Bool {
    return budget > 10000
}

var stopLights = 4

if let townPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 100000, condition: evaluate) {
    stopLights = townPlanByAddingLightsToExistingLights(4, stopLights)
}

print("Knowhere has \(stopLights) stoplights.")
