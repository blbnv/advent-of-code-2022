import Foundation

/// Simple stacks filling
let stacks: [Stack] = [
    Stack("HCR"),
    Stack("BJHLSF"),
    Stack("RMDHJTQ"),
    Stack("SGRHZBJ"),
    Stack("RPFZTDCB"),
    Stack("THCG"),
    Stack("SNVZBPWL"),
    Stack("RJQGC"),
    Stack("LDTRHPFS")
]

print("Welcome to day 5")
let input = try String(contentsOfFile: "input.txt", encoding: .utf8)
let lines = input.components(separatedBy: .newlines)

print("Part 1")
lines.forEach { move($0) }
var result = String()
for stack in stacks where !stack.array.isEmpty {
    result.append(stack.array.last!)
}
print("Top items: \(result)")

print("Part 2")
lines.forEach { move_p2($0) }
var resultP2 = String()
for stack in stacks where !stack.array.isEmpty {
    resultP2.append(stack.array.last!)
}
print("Top items for part 2: \(resultP2)")

func move(_ string: String) {
    let separated = string.components(separatedBy: " ")
    let amount = Int(separated[1])!
    let from = Int(separated[3])! - 1
    let to = Int(separated.last!)! - 1
    
    for _ in 0..<amount {
        let pop = stacks[from].pop()
        stacks[to].add(pop)
    }
}

func move_p2(_ string: String) {
    let separated = string.components(separatedBy: " ")
    let amount = Int(separated[1])!
    let from = Int(separated[3])! - 1
    let to = Int(separated.last!)! - 1
    
    var popped = [Character]()
    for _ in 0..<amount {
        popped.append(stacks[from].pop())
    }
    
    for _ in 0..<amount {
        let pop = popped.removeLast()
        stacks[to].add(pop)
    }
}

final class Stack {
    var array = [Character]()
    
    init(_ string: String) {
        self.array = Array(string)
    }
    
    func pop() -> Character {
        return self.array.removeLast()
    }
    
    func add(_ i: Character) {
        self.array.append(i)
    }
}
