import Foundation

print("Welcome to day 2")
let input = try String(contentsOfFile: "input.txt", encoding: .utf8)
let lines = input.components(separatedBy: .newlines)
print("Part 1")

var score = lines.reduce(0) { $0 + part1($1) }
print("Total score = \(score)")

print("Part 2")
score = 0
score = lines.reduce(0) { $0 + part2($1) }
print("Total score = \(score)")

func part1(_ line: String) -> Int {
    let opponent = Array(line)[0].variant
    let me = Array(line)[2].variant
    return me.against(opponent).rawValue + me.rawValue
}

func part2(_ line: String) -> Int {
    let opponent = Array(line)[0].variant
    let result = Array(line)[2].gameResult
    return result.rawValue + result.myVariant(opponent).rawValue
}

enum Variant: Int {
    case rock = 1
    case paper = 2
    case scisors = 3
    
    var winMove: Variant {
        switch self {
        case .rock: return .paper
        case .paper: return .scisors
        case .scisors: return .rock
        }
    }
    
    var loseMove: Variant {
        switch self {
        case .rock: return .scisors
        case .paper: return .rock
        case .scisors: return .paper
        }
    }
    
    func against(_ variant: Variant) -> GameResult {
        // Draw
        guard self != variant else { return .draw }
        // Different variants
        switch self {
        case .rock: return variant == .paper ? .lose : .win
        case .paper: return variant == .scisors ? .lose : .win
        case .scisors: return variant == .rock ? .lose : .win
        }
    }
}

enum GameResult: Int {
    case win = 6
    case lose = 0
    case draw = 3
    
    func myVariant(_ against: Variant) -> Variant {
        switch self {
        case .win: return against.winMove
        case .lose: return against.loseMove
        case .draw: return against
        }
    }
}

extension Character {
    // For part 1
    var variant: Variant {
        switch self {
        case "A", "X": return .rock
        case "B", "Y": return .paper
        case "C", "Z": return .scisors
        default: fatalError("unexpected")
        }
    }

    // For part 2
    var gameResult: GameResult {
        switch self {
        case "X": return .lose
        case "Y": return .draw
        case "Z": return .win
        default: fatalError()
        }
    }
}
