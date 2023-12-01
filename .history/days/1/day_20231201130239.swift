import Foundation

func replaceDigits(input: String) -> String {
  var result = input
  let digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

  for digit in digits {
    result = result.replacingOccurrences(of: digit, with: String(digits.firstIndex(of: digit)!))
  }

  return result
}

func getDigits(input: String) -> Int {
  var firstDigit = ""
  var lastDigit = ""

  for char in input where char.isNumber {
    firstDigit = String(char)
    break
  }

  for char in input.reversed() where char.isNumber {
    lastDigit = String(char)
    break
  }

  guard let number = Int(firstDigit + lastDigit) else {
    fatalError("Invalid number")
  }
  return number
}

let input = try String(contentsOfFile: "days/1/input.txt").components(separatedBy: "\n")

let digits = input.map { getDigits(input: $0) }

print("Answer to the first puzzle is:")
print(digits.reduce(0, +))
