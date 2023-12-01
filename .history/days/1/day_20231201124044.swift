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

  // return the Int value of a string composed of the first and last digits
  return Int(firstDigit + lastDigit)
}
