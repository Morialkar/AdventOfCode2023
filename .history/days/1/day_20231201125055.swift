import Foundation

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

// guard let filePath = Bundle.main.path(forResource: "input", ofType: "txt") else {
//   fatalError("Input file not found")
// }

let input = try String(contentsOfFile: "input.txt").components(separatedBy: "\n")

let digits = input.map { getDigits(input: $0) }

print(digits.reduce(0, +))
