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

func searchForDigit(input: String) -> [(lowerBound: Int, higherBound: Int, digit: String)] {
  let digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  var foundDigits = [(lowerBound: Int, higherBound: Int, digit: String)]()
  for (index, char) in input.enumerated() where char.isNumber {
    foundDigits.append((index, index, String(char)))
  }
  for (index, digit) in digits.enumerated() {
    if let lowerBound = input.range(of: digit)?.lowerBound,
      let higherBound = input.range(of: digit)?.upperBound
    {
      foundDigits.append((lowerBound.encodedOffset, higherBound.encodedOffset, String(index)))
    }
  }
  return foundDigits
}

func getDigitsIncludingSubstrings(input: String) -> Int {
  var firstDigit = ""
  var lastDigit = ""

  while firstDigit == "" {
    for ind in 0..<input.count {
      let substring = input.prefix(ind)
      let foundDigits = searchForDigit(input: String(substring))

      if let firstFoundDigit = foundDigits.sorted(by: { $0.lowerBound < $1.lowerBound }).first {
        firstDigit = firstFoundDigit.digit
        break
      }
    }
  }

  while lastDigit == "" {
    for ind in 0..<input.count {
      let substring = input.suffix(ind)
      let foundDigits = searchForDigit(input: String(substring))

      print(input, foundDigits)

      if let lastFoundDigit = foundDigits.sorted(by: { $0.higherBound > $1.higherBound }).first {
        lastDigit = lastFoundDigit.digit
        break
      }
    }
  }

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
