import Foundation

typealias Game = (id: Int, picks: [[(color: String, amount: Int)]])
typealias Bag = [(color: String, amount: Int)]

func parseGame(input: String) -> Game {
  let gameComponents = input.components(separatedBy: ":")
  let id = Int(gameComponents[0].components(separatedBy: " ")[1])!

  let picks = gameComponents[1]
    .components(separatedBy: ";")
    .map { $0.components(separatedBy: ", ") }
    .map { $0.map { $0.components(separatedBy: " ") } }
    .map {
      $0.map { (color: $0[0] == "" ? $0[2] : $0[1], amount: Int($0[0] == "" ? $0[1] : $0[0])!) }
    }

  return (id: id, picks: picks)
}

func validateGames(games: [Game], bag: Bag) -> Int {
  var validGames = 0

  for game in games {
    var valid = true

    for pick in game.picks {
      // validate that the bag can contain the pick
      for bagItem in bag {
        if pick.contains(where: { $0.color == bagItem.color && $0.amount > bagItem.amount }) {
          valid = false
          break
        }
      }
    }

    if valid {
      validGames += game.id
    }
  }

  return validGames
}

func getTotalPowerOfMinimalGames(games: [Game]) -> Int {
  var totalPower = 0

  for game in games {
    var minimalAmountOfRed = 0
    var minimalAmountOfGreen = 0
    var minimalAmountOfBlue = 0

    for pick in game.picks {
      for item in pick {
        switch item.color {
        case "red":
          minimalAmountOfRed = max(minimalAmountOfRed, item.amount)
        case "green":
          minimalAmountOfGreen = max(minimalAmountOfGreen, item.amount)
        case "blue":
          minimalAmountOfBlue = max(minimalAmountOfBlue, item.amount)
        default:
          break
        }
      }
    }

    totalPower += minimalAmountOfRed * minimalAmountOfGreen * minimalAmountOfBlue
  }

  return totalPower
}

let input = try String(contentsOfFile: "days/2/input.txt").components(separatedBy: "\n")
let games: [Game] = input.map { parseGame(input: $0) }

print("Answer to the first puzzle is:")
print(validateGames(games: games, bag: [("red", 12), ("green", 13), ("blue", 14)]))

print("Answer to the second puzzle is:")
print(getTotalPowerOfMinimalGames(games: games)
