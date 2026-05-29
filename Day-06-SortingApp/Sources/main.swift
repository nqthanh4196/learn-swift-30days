// ============================================
// Day 06 - SortingApp
// Topic: Closures
// ============================================

// MARK: - 1. Basic Closures
let multiply: (Int, Int) -> Int = { $0 * $1 }
let isEven: (Int) -> Bool = { $0 % 2 == 0 }

print("🔢 5 x 3 = \(multiply(5, 3))")
print("🔢 4 is even: \(isEven(4))")
print("")

// MARK: - 2. Sorting App
struct Student {
    let name: String
    let score: Double
    let age: Int
}

let students = [
    Student(name: "Thanh", score: 8.5, age: 22),
    Student(name: "Minh", score: 9.2, age: 21),
    Student(name: "Lan", score: 8.5, age: 23),
    Student(name: "Hùng", score: 7.8, age: 22),
    Student(name: "Mai", score: 9.2, age: 20),
]

// Sort by score (descending)
let byScore = students.sorted { $0.score > $1.score }
print("📊 Sorted by Score (desc):")
byScore.forEach { print("  \($0.name): \($0.score)") }

// Sort by name (ascending)
let byName = students.sorted { $0.name < $1.name }
print("\n📊 Sorted by Name:")
byName.forEach { print("  \($0.name)") }

// Sort by score desc, then age asc (tie-breaking)
let byScoreThenAge = students.sorted {
    if $0.score != $1.score { return $0.score > $1.score }
    return $0.age < $1.age
}
print("\n📊 Sorted by Score then Age:")
byScoreThenAge.forEach { print("  \($0.name): \($0.score) (age \($0.age))") }
print("")

// MARK: - 3. Map, Filter, Reduce
let scores = students.map { $0.score }
let highScorers = students.filter { $0.score >= 9.0 }
let averageScore = scores.reduce(0, +) / Double(scores.count)

print("📈 All scores: \(scores)")
print("⭐ High scorers (≥9.0): \(highScorers.map { $0.name })")
print("📊 Average: \(String(format: "%.2f", averageScore))")
print("")

// MARK: - 4. Chaining
let result = students
    .filter { $0.age >= 21 }
    .sorted { $0.score > $1.score }
    .map { "\($0.name) (\($0.score))" }

print("🔗 Age ≥ 21, sorted by score:")
result.forEach { print("  \($0)") }
print("")

// MARK: - 5. Custom higher-order function
func apply(_ values: [Int], transform: (Int) -> Int) -> [Int] {
    return values.map(transform)
}

let numbers = [1, 2, 3, 4, 5]
let squared = apply(numbers) { $0 * $0 }
let tripled = apply(numbers) { $0 * 3 }
print("🧮 Numbers: \(numbers)")
print("   Squared: \(squared)")
print("   Tripled: \(tripled)")
