// Make a command line program that accepts a number parameter (-d --day) and run the day.swift in the corresponding days/[number] folder

import Foundation

let arguments = CommandLine.arguments
let day = arguments[1]? == "" ? "1" : arguments[1]

let task = Process()
print("Day \(day)...")
print("")
task.launchPath = "/usr/bin/env"
task.arguments = ["swift", "days/\(day)/day.swift"]
task.launch()
task.waitUntilExit()

print("")

print("Day \(day) Completed! Run next day? (Y/n)")
// Await a Y or N, defaulting to Y, and if Y, run this script again with the next day
let nextDay = readLine(strippingNewline: true) ?? "Y"
if nextDay == "Y" {
    let nextDayNumber = Int(day)! + 1
    let nextDayString = String(nextDayNumber)
    let nextTask = Process()
    nextTask.launchPath = "/usr/bin/env"
    nextTask.arguments = ["swift", "run.swift", nextDayString]
    nextTask.launch()
    nextTask.waitUntilExit()
}
