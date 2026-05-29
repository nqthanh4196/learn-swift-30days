// ============================================
// Day 06 - Extra Examples
// ============================================

// MARK: - Example 1: Capturing values
func makeCounter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}

let counter = makeCounter()
print("Counter: \(counter()), \(counter()), \(counter())")

// MARK: - Example 2: CompactMap (filter nil)
let strings = ["1", "two", "3", "four", "5"]
let numbers = strings.compactMap { Int($0) }
print("\nValid numbers: \(numbers)")

// MARK: - Example 3: Closure as callback
func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int, completion: (Int) -> Void) {
    let result = operation(a, b)
    completion(result)
}

performOperation(10, 5, operation: +) { result in
    print("\n10 + 5 = \(result)")
}

performOperation(10, 5, operation: *) { result in
    print("10 * 5 = \(result)")
}
