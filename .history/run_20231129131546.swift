// Make a command line program that accepts a number parameter (-d --day) and run the day.swift in the corresponding days/[number] folder

import Foundation

let arguments = CommandLine.arguments
let day = arguments[1]

let task = Process()
task.launchPath = "/usr/bin/env"
task.arguments = ["swift", "days/\(day)/day.swift"]
task.launch()
task.waitUntilExit()

print("Ran Day \(day)!")
