
var bucketList = ["Climg Mt. Everest"]

var newItems = [
                "Fly hot air balloon to Fiji",
                "Watch the Lord of the Rings trilogy in one day",
                "Go on a walkabout",
                "Scuba dive in the Great Blue Hole",
                "Find a triple rainbow"
                ]
bucketList += newItems

bucketList
bucketList.remove(at: 2)
print(bucketList[0...2])
bucketList[2] += " in Australia"
bucketList
bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList.insert("Toboggan across Alaska", at: 2)
bucketList

var myronsList = [
                   "Climb Mt. Kilimanjaro",
                   "Fly hot air balloon to Fiji",
                   "Toboggan across Alaska",
                   "Go on a walkabout in Australia",
                   "Scuba dive in the Great Blue Hole",
                   "Find a triple rainbow"
                   ]

let equal = bucketList == myronsList


var toDoList = ["Take out garbage", "Pay bills", "Cross off finished items"]
print(!toDoList.isEmpty)

var start = 0;
var end = toDoList.count - 1
while start < end
{
    let temp = toDoList[start]
    toDoList[start] = toDoList[end]
    toDoList[end] = temp
    
    start += 1
    end -= 1
}

toDoList


let flyFiji = bucketList.index(of: "Fly hot air balloon to Fiji")

if let index = flyFiji
{
    print("\(toDoList[index]) is at index \(index)")
}
else
{
    print("Not in bucket list")
}
