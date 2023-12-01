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

  print(firstDigit, lastDigit, firstDigit + lastDigit, Int(firstDigit + lastDigit) ?? 0)

  guard let number = Int(firstDigit + lastDigit) else {
    fatalError("Invalid number")
  }
  return number
}

func getDigitsIncludingSubstrings(input: String) -> Int {
  var firstDigit = ""
  var lastDigit = ""
  let digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

  while firstDigit == "" {
    for ind in 0..<input.count {
      let substring = input.prefix(ind)
      var foundDigits = [(index: Int, digit: String)]()
      for (index, char) in substring.enumerated() where char.isNumber {
        foundDigits.append((index, String(char)))
      }

      for digit in digits {
        if let index = substring.range(of: digit)?.lowerBound {
          foundDigits.append((index, digit))
        }
      }

      if let firstFoundDigit = foundDigits.sorted(by: { $0.index < $1.index }).first {
        firstDigit = firstFoundDigit.digit
        break
      }
    }
  }

  while lastDigit == "" {
    for ind in 0..<input.count {
      let substring = input.suffix(ind)
      var foundDigits = [(index: Int, digit: String)]()
      for (index, char) in substring.enumerated() where char.isNumber {
        foundDigits.append((index, String(char)))
      }

      for digit in digits {
        if let index = substring.range(of: digit)?.lowerBound {
          foundDigits.append((index, digit))
        }
      }

      if let lastFoundDigit = foundDigits.sorted(by: { $0.index > $1.index }).first {
        lastDigit = lastFoundDigit.digit
        break
      }
    }
  }

  print(firstDigit, lastDigit, firstDigit + lastDigit, Int(firstDigit + lastDigit) ?? 0)

  guard let number = Int(firstDigit + lastDigit) else {
    fatalError("Invalid number")
  }
  return number
}

let input = try String(contentsOfFile: "days/1/input.txt").components(separatedBy: "\n")

let digits = input.map { getDigits(input: $0) }
let replaced = input.map { getDigitsIncludingSubstrings(input: $0) }
print("Answer to the first puzzle is:")
print(digits.reduce(0, +))

print("Answer to the second puzzle is:")
print(replaced.reduce(0, +))
