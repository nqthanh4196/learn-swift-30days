// ============================================
// Day 08 - Extra Examples
// ============================================

// MARK: - Example 1: Array slicing
let numbers = [10, 20, 30, 40, 50, 60, 70]
let firstThree = Array(numbers.prefix(3))
let lastTwo = Array(numbers.suffix(2))
print("First 3: \(firstThree)")
print("Last 2: \(lastTwo)")

// MARK: - Example 2: Array transformation
let words = ["hello", "world", "swift"]
let capitalized = words.map { $0.capitalized }
let lengths = words.map { $0.count }
print("\nCapitalized: \(capitalized)")
print("Lengths: \(lengths)")

// MARK: - Example 3: Remove duplicates with Set
let withDuplicates = [1, 2, 2, 3, 3, 3, 4, 5, 5]
let unique = Array(Set(withDuplicates)).sorted()
print("\nOriginal: \(withDuplicates)")
print("Unique: \(unique)")
