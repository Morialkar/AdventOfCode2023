import Foundation

typealias Game = (id: Int, picks: [[(color: String, amount: Int)]])

func parseGame(input: String) -> Game {
  let gameComponents = input.components(separatedBy: ":")
  let id = Int(gameComponents[0].components(separatedBy: " ")[1])!

  print(gameComponents[1])
  print(gameComponents[1].components(separatedBy: ", "))
  print(gameComponents[1].components(separatedBy: ", ").map { $0.components(separatedBy: " ") })

  let picks = gameComponents[1]
    .components(separatedBy: ";")
    .map { $0.components(separatedBy: ", ") }
    .map { $0.map { $0.components(separatedBy: " ") } }
    .map {
      $0.map { (color: $0[0] == "" ? $0[2] : $0[1], amount: Int($0[0] == "" ? $0[1] : $0[0])!) }
    }
}

let input = try String(contentsOfFile: "days/2/input.txt").components(separatedBy: "\n")
let games: [Game] = input.map { parseGame(input: $0) }

print(games)
// let ids = input.map { getDigitsIncludingSubstrings(input: $0) }
print("Answer to the first puzzle is:")
// print(digits.reduce(0, +))

// print("Answer to the second puzzle is:")
// print(replaced.reduce(0, +))
