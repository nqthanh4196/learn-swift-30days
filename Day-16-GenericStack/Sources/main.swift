// ============================================
// Day 16 - GenericStack
// Topic: Generics
// ============================================

// MARK: - Generic Stack
struct Stack<Element> {
    private var items: [Element] = []
    
    var count: Int { items.count }
    var isEmpty: Bool { items.isEmpty }
    var peek: Element? { items.last }
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        items.popLast()
    }
    
    func toArray() -> [Element] { items }
}

// Extension with constraint
extension Stack where Element: Equatable {
    func contains(_ item: Element) -> Bool {
        items.contains(item)
    }
}

extension Stack where Element: Numeric {
    var sum: Element { items.reduce(0, +) }
}

extension Stack: CustomStringConvertible where Element: CustomStringConvertible {
    var description: String {
        let content = items.map { $0.description }.joined(separator: ", ")
        return "Stack[\(content)]"
    }
}

// MARK: - Generic Queue
struct Queue<Element> {
    private var items: [Element] = []
    
    var count: Int { items.count }
    var isEmpty: Bool { items.isEmpty }
    var front: Element? { items.first }
    
    mutating func enqueue(_ item: Element) {
        items.append(item)
    }
    
    mutating func dequeue() -> Element? {
        isEmpty ? nil : items.removeFirst()
    }
}

// MARK: - Generic Pair
struct Pair<A, B> {
    let first: A
    let second: B
}

// MARK: - Generic function
func findAll<T: Equatable>(_ value: T, in array: [T]) -> [Int] {
    array.enumerated().compactMap { $0.element == value ? $0.offset : nil }
}

// MARK: - Demo
print("📦 Generic Stack")
print("================================\n")

// Int Stack
var intStack = Stack<Int>()
intStack.push(10)
intStack.push(20)
intStack.push(30)
print("Int stack: \(intStack)")
print("Sum: \(intStack.sum)")
print("Contains 20: \(intStack.contains(20))")
print("Pop: \(intStack.pop() ?? 0)")
print("After pop: \(intStack)")

// String Stack
print("")
var stringStack = Stack<String>()
stringStack.push("Swift")
stringStack.push("is")
stringStack.push("awesome")
print("String stack: \(stringStack)")
print("Peek: \(stringStack.peek ?? "")")

// Queue
print("\n📬 Generic Queue:")
var queue = Queue<String>()
queue.enqueue("Task 1")
queue.enqueue("Task 2")
queue.enqueue("Task 3")
print("Front: \(queue.front ?? "")")
print("Dequeue: \(queue.dequeue() ?? "")")
print("New front: \(queue.front ?? "")")

// Pair
print("\n🔗 Generic Pair:")
let coordinate = Pair(first: 10.5, second: 20.3)
let nameAge = Pair(first: "Thanh", second: 25)
print("Coordinate: (\(coordinate.first), \(coordinate.second))")
print("Person: \(nameAge.first), age \(nameAge.second)")

// Generic function
print("\n🔍 Find all:")
let numbers = [1, 3, 5, 3, 7, 3, 9]
print("Indices of 3 in \(numbers): \(findAll(3, in: numbers))")
