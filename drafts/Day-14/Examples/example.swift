// ============================================
// Day 14 - Extra Examples
// ============================================

// MARK: - Example 1: Protocol with associated type
protocol Stack {
    associatedtype Element
    mutating func push(_ item: Element)
    mutating func pop() -> Element?
    var isEmpty: Bool { get }
}

struct IntStack: Stack {
    private var items: [Int] = []
    mutating func push(_ item: Int) { items.append(item) }
    mutating func pop() -> Int? { items.popLast() }
    var isEmpty: Bool { items.isEmpty }
}

var stack = IntStack()
stack.push(1); stack.push(2); stack.push(3)
print("Pop: \(stack.pop() ?? 0)")

// MARK: - Example 2: Protocol as type constraint
func printCollection<T: Collection>(_ collection: T) where T.Element: CustomStringConvertible {
    let items = collection.map { $0.description }
    print("[\(items.joined(separator: ", "))]")
}

printCollection([1, 2, 3])
printCollection(["a", "b", "c"])

// MARK: - Example 3: Equatable & Comparable
struct Score: Comparable {
    let value: Int
    let player: String
    static func < (lhs: Score, rhs: Score) -> Bool { lhs.value < rhs.value }
}

let scores = [Score(value: 85, player: "A"), Score(value: 92, player: "B"), Score(value: 78, player: "C")]
let sorted = scores.sorted()
print("\nSorted: \(sorted.map { "\($0.player):\($0.value)" })")
