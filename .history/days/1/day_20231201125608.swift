import Foundation

// find all spelled out digits in the input and return a string where they are replaced by the number itself. Example: "three" becomes "3"
func replaceSpelledOutDigits(input: String) -> String {
  let spelledOutDigits = [
    "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
  ]

  var result = input
  for digit in spelledOutDigits {
    result = result.replacingOccurrences(
      of: digit, with: String(spelledOutDigits.firstIndex(of: digit)!))
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
