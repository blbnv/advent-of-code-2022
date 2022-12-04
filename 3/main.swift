import Foundation

print("Welcome to day 3")

let input = try String(contentsOfFile: "input.txt", encoding: .utf8)
let lines = input.components(separatedBy: .newlines)

print("Part 1")
let prioritiesSum = lines.reduce(0) { $0 + bagPriority($1) }
print("Priorities sum: \(prioritiesSum)")

func bagPriority(_ line: String) -> Int {
    let lineArray = Array(line)
    let halfOne = Set(lineArray[0...line.count/2 - 1])
    let halfTwo = Set(lineArray[(line.count / 2)...])
    let priority = halfOne.intersection(halfTwo).first!
    let asciiValue = Int(priority.asciiValue!)
    let score = priority.isLowercase ? asciiValue - 96 : asciiValue - 38
    return score
}
