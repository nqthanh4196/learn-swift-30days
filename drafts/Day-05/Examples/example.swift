// ============================================
// Day 05 - Extra Examples
// ============================================

// MARK: - Example 1: Nested functions
func makeCounter(startAt start: Int = 0) -> () -> Int {
    var count = start
    func increment() -> Int {
        count += 1
        return count
    }
    return increment
}

let counter = makeCounter(startAt: 10)
print("Counter: \(counter()), \(counter()), \(counter())")

// MARK: - Example 2: Inout parameters
func normalize(_ values: inout [Double]) {
    guard let max = values.max(), max != 0 else { return }
    for i in values.indices {
        values[i] /= max
    }
}

var scores = [80.0, 95.0, 70.0, 88.0]
print("\nBefore: \(scores)")
normalize(&scores)
print("After normalize: \(scores.map { String(format: "%.2f", $0) })")

// MARK: - Example 3: Function that returns multiple values
func minMax(of array: [Int]) -> (min: Int, max: Int)? {
    guard !array.isEmpty else { return nil }
    return (array.min()!, array.max()!)
}

if let result = minMax(of: [3, 1, 7, 2, 9]) {
    print("\nMin: \(result.min), Max: \(result.max)")
}
