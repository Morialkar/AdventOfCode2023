typealias game = (id: Int, picks: [(color: String, amount: Int)])

func parseGame(input: String) -> game {
  let id = Int(input.components(separatedBy: ":")[0].components(separatedBy: " ")[1])!
  let picks = input.components(separatedBy: "contain ")[1]
    .components(separatedBy: ", ")
    .map { $0.components(separatedBy: " ") }
    .map { (color: $0[1] + " " + $0[2], amount: Int($0[0])!) }
  return (id: id, picks: picks)
}


let input = try String(contentsOfFile: "days/2/input.txt").components(separatedBy: "\n")
let games = 

let ids = input.map {  }
// let ids = input.map { getDigitsIncludingSubstrings(input: $0) }
print("Answer to the first puzzle is:")
print(digits.reduce(0, +))

// print("Answer to the second puzzle is:")
// print(replaced.reduce(0, +))
