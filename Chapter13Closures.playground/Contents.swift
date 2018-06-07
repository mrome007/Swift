//: Playground - noun: a place where people can play

import Cocoa

var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

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

//sort in place gone in Swift4
volunteerCounts.sort()


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

if let townPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 1000, condition: evaluate) {
    stopLights = townPlanByAddingLightsToExistingLights(4, stopLights)
}

if let newTownPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 10500, condition: evaluate) {
    stopLights = newTownPlanByAddingLightsToExistingLights(4, stopLights)
}

print("Knowhere has \(stopLights) stoplights.")

func makePopulationTracker(forInitialPopulation population: Int) -> (Int) -> Int {
    var totalPopulation = population
    func populationTracker(growth: Int) -> Int {
        totalPopulation += growth
        return totalPopulation
    }
    
    return populationTracker
}

var currentPopulation = 5422
let growBy = makePopulationTracker(forInitialPopulation: currentPopulation)
growBy(500)
growBy(500)
growBy(500)
currentPopulation = growBy(500)
let anotherGrowBy = growBy
anotherGrowBy(500)

var bigCityPopulation = 4061981
let bigCityGrowBy = makePopulationTracker(forInitialPopulation: bigCityPopulation)
bigCityPopulation = bigCityGrowBy(10000)
currentPopulation

let precinctPopulations = [1244, 2021, 2157]
let projectedPopulations = precinctPopulations.map {
    (population: Int) -> Int in
    return population * 2
}

let totalProjection = projectedPopulations.reduce(0) { $0 + $1 }
totalProjection
