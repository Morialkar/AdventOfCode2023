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

let input = try String(contentsOfFile: "input.txt").components(separatedBy: "\n")

let digits = input.map { getDigits(input: $0) }

print(digits.reduce(0, +))
