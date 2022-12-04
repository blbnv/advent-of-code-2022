import Algorithms
import Foundation

print("Welcome to day 1")
let input = try String(contentsOfFile: "input.txt", encoding: .utf8)
let lines = input.components(separatedBy: .newlines)

print("Part 1")
let maxCalories = part1(lines)
print("Max Calories: \(maxCalories)")

print("Part 2")
let topThreeSum = part2(lines)
print("Top three sum: \(topThreeSum)")

func part1(_ lines: [String]) -> Int {
    var result = 0, current = 0
    for line in lines {
        if let numLine = Int(line) { current += numLine; continue }
        result = max(result, current); current = 0
    }
    return result
}

func part2(_ lines: [String]) -> Int {
    var current = 0
    var sums = [Int]()
    for line in lines {
        if let numLine = Int(line) { current += numLine; continue }
        sums.append(current); current = 0
    }
    return sums.max(count: 3).reduce(0, +)
}
