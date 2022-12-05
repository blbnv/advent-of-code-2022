import Foundation

print("Welcome to day 3")

let input = try String(contentsOfFile: "input.txt", encoding: .utf8)
let lines = input.components(separatedBy: .newlines)

print("Part 1")
let prioritiesSum = lines.reduce(0) { $0 + bagPriority($1) }
print("Priorities sum: \(prioritiesSum)")

print("Part 2")
let badgePrioritiesSum = badgePrioritySum(lines)
print("Badge priorities sum: \(badgePrioritiesSum)")

func bagPriority(_ line: String) -> Int {
    let lineArray = Array(line)
    let halfOne = Set(lineArray[0...line.count/2 - 1])
    let halfTwo = Set(lineArray[(line.count / 2)...])
    let priority = halfOne.intersection(halfTwo).first!
    let asciiValue = Int(priority.asciiValue!)
    let score = priority.isLowercase ? asciiValue - 96 : asciiValue - 38
    return score
}

func badgePrioritySum(_ lines: [String]) -> Int {
    let divided = lines.chunked(into: 3)
    return divided.reduce(0) { $0 + singleChunkPriority($1) }
}

func singleChunkPriority(_ chunk: [String]) -> Int {
    var set1 = Set<Character>(), set2 = Set<Character>()
    chunk[0].forEach { set1.insert($0) }
    chunk[1].forEach { set2.insert($0) }
    let set12 = set1.intersection(set2)
    var set3 = Set<Character>()
    chunk[2].forEach { set3.insert($0) }
    let element = set12.intersection(set3).first!
    let asciiValue = Int(element.asciiValue!)
    let score = element.isLowercase ? asciiValue - 96 : asciiValue - 38
    return score
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
