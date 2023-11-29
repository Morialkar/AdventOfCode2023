import Foundation

let day = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : "1"

let task = Process()
print("Day \(day)...")
print("")
task.launchPath = "/usr/bin/env"
task.arguments = ["swift", "days/\(day)/day.swift"]
task.launch()
task.waitUntilExit()

print("")

print("Day \(day) Completed! Run day \(Int(day)! + 1)? (Y/n)")
// Await a Y or N, defaulting to Y, and if Y, run this script again with the next day
let nextDay = readLine() == "" ? "Y" : readLine()!
if nextDay.lowercased() == "y" {
  let nextDayNumber = Int(day)! + 1
  let nextDayString = String(nextDayNumber)
  let nextTask = Process()
  nextTask.launchPath = "/usr/bin/env"
  nextTask.arguments = ["swift", "run.swift", nextDayString]
  nextTask.launch()
  nextTask.waitUntilExit()
}
