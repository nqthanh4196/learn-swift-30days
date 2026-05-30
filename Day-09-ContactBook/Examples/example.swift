// ============================================
// Day 09 - Extra Examples
// ============================================

// MARK: - Example 1: Dictionary grouping
let words = ["apple", "banana", "avocado", "blueberry", "cherry", "apricot"]
let grouped = Dictionary(grouping: words) { $0.first! }
for (letter, items) in grouped.sorted(by: { $0.key < $1.key }) {
    print("[\(letter)] \(items)")
}

// MARK: - Example 2: Counting with dictionary
let text = "hello swift"
var frequency: [Character: Int] = [:]
for char in text where char != " " {
    frequency[char, default: 0] += 1
}
print("\nCharacter frequency:")
for (char, count) in frequency.sorted(by: { $0.value > $1.value }) {
    print("  '\(char)': \(count)")
}

// MARK: - Example 3: Merging dictionaries
let defaults = ["theme": "light", "language": "en", "fontSize": "14"]
let userPrefs = ["theme": "dark", "fontSize": "16"]
let merged = defaults.merging(userPrefs) { _, new in new }
print("\nMerged settings: \(merged)")
