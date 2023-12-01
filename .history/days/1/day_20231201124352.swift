import Foundation

func getDigits(input: String) -> Int {
  let firstDigit = ""
  let lastDigit = ""

  for char in input where char.isDigit {
    firstDigit = char
    break
  }

  for char in input.reversed() where char.isDigit {
    lastDigit = char
    break
  }

  return Int(firstDigit + lastDigit)
}

guard let filePath = Bundle.main.path(forResource: "input", ofType: "txt") else {
  fatalError("Input file not found")
}

let input = try String(contentsOfFile: filePath).components(separatedBy: "\n")

let digits = input.map { getDigits(input: $0) }

print(digits.reduce(0, +))
