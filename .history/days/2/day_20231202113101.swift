let input = try String(contentsOfFile: "days/2/input.txt").components(separatedBy: "\n")

let digits = input.map { getDigits(input: $0) }
let replaced = input.map { getDigitsIncludingSubstrings(input: $0) }
print("Answer to the first puzzle is:")
print(digits.reduce(0, +))

print("Answer to the second puzzle is:")
print(replaced.reduce(0, +))
