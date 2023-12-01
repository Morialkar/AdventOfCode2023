import Foundation

func replaceDigits(input: String) -> String {
  let digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  var ranges = [(range: Range<String.Index>, digit: String)]()
  var returned = ""

  // Find the ranges of all spelled out digits
  for (index, digit) in digits.enumerated() {
    var start = input.startIndex
    while let range = input.range(of: digit, range: start..<input.endIndex) {
      ranges.append((range, String(index)))
      start = range.upperBound
    }
  }

  // If there are no spelled out digits, return the input
  guard ranges.count > 0 else {
    print(input)
    return input
  }

  // Sort the ranges by their lowerBound
  ranges.sort { $0.range.lowerBound < $1.range.lowerBound }

  // Replace the first and last spelled out digit
  if let first = ranges.first {
    let before = input.index(before: first.range.lowerBound)

    if input[before].isNumber {
      returned = input
    } else {
      returned = input.replacingCharacters(in: first.range, with: first.digit)
    }
  }

  ranges = [(range: Range<String.Index>, digit: String)]()

  // Find the ranges again of all spelled out digits since we changed the string
  for (index, digit) in digits.enumerated() {
    var start = returned.startIndex
    while let range = returned.range(of: digit, range: start..<returned.endIndex) {
      ranges.append((range, String(index)))
      start = range.upperBound
    }
  }

  // Sort the ranges again too by their lowerBound
  ranges.sort { $0.range.lowerBound < $1.range.lowerBound }

  guard ranges.count > 0 else {
    print(input, returned)
    return returned
  }

  if let last = ranges.last {
    returned = returned.replacingCharacters(in: last.range, with: last.digit)
  }

  print(input, returned)

  return returned
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

  print(firstDigit, lastDigit, firstDigit + lastDigit, Int(firstDigit + lastDigit) ?? 0)

  guard let number = Int(firstDigit + lastDigit) else {
    fatalError("Invalid number")
  }
  return number
}

let input = try String(contentsOfFile: "days/1/input.txt").components(separatedBy: "\n")

let digits = input.map { getDigits(input: $0) }

print("Answer to the first puzzle is:")
print(digits.reduce(0, +))

let replaced = input.map { getDigits(input: replaceDigits(input: $0)) }

print("Answer to the second puzzle is:")
print(replaced.reduce(0, +))
