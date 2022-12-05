import Foundation

print("Welcome to day 3")

let input = try String(contentsOfFile: "input.txt", encoding: .utf8)
let lines = input.components(separatedBy: .newlines)

print("Part 1")
let overlaps = overlappingRangesCount(lines)
print("\(overlaps) ranges overlaps")

print("Part 2")
let partialOverlap = overlapsPartially(lines)
print("\(partialOverlap) ranges overlaps")

func overlappingRangesCount(_ lines: [String]) -> Int {
    return lines.filter { isOverlap($0) }.count
}

func isOverlap(_ string: String) -> Bool {
    let ranges = string.components(separatedBy: ",")
    let one = range(ranges[0])
    let two = range(ranges[1])
    return one.fullyContains(two) || two.fullyContains(one)
}

extension Range<Int> {
    func fullyContains(_ range: Range<Int>) -> Bool {
        return self.contains(range.upperBound) && self.contains(range.lowerBound)
    }
}

func overlapsPartially(_ lines: [String]) -> Int {
    return lines.filter { isPartialOverlap($0) }.count
}

func isPartialOverlap(_ string: String) -> Bool {
    let ranges = string.components(separatedBy: ",")
    let range1 = range(ranges[0])
    let range2 = range(ranges[1])
    return range1.overlaps(range2)
}

func range(_ s: String) -> Range<Int> {
    let split = s.components(separatedBy: "-")
    return Range(Int(split[0])!...Int(split[1])!)
}
