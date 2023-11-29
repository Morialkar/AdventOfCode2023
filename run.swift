import Foundation

func runDay(_ day: Int) {
  print("Day \(day)...")
  print("")

  let task = Process()
  task.launchPath = "/usr/bin/env"
  task.arguments = ["swift", "days/\(day)/day.swift"]
  task.launch()
  task.waitUntilExit()

  print("")

  print("Day \(day) Completed! Run day \(day + 1)? (Y/n)")
  // Await a Y or N, defaulting to Y, and if Y, run this script again with the next day
  let nextDay = readLine() == "" ? "Y" : readLine()!
  if nextDay.lowercased() == "y" {
    runDay(day + 1)
  }
}

let day = CommandLine.arguments.count > 1 ? Int(CommandLine.arguments[1]) ?? 1 : 1
runDay(day)
