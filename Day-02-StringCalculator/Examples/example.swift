// ============================================
// Day 02 - Extra Examples
// ============================================

// MARK: - Example 1: Nil Coalescing Operator
let nickname: String? = nil
let displayName = nickname ?? "Anonymous"
print("👤 Display: \(displayName)")

// MARK: - Example 2: Range Operators
print("\n🔢 Closed Range (1...5):")
for i in 1...5 { print("  \(i)", terminator: "") }

print("\n🔢 Half-Open Range (1..<5):")
for i in 1..<5 { print("  \(i)", terminator: "") }

print("\n🔢 One-Sided Range:")
let numbers = [10, 20, 30, 40, 50]
print("  From index 2: \(numbers[2...])")
print("  Up to index 3: \(numbers[...2])")

// MARK: - Example 3: String Operations
let firstName = "Quốc"
let lastName = "Thanh"
let fullName = firstName + " " + lastName
print("\n📝 Concatenation: \(fullName)")
print("📝 Uppercase: \(fullName.uppercased())")
print("📝 Character count: \(fullName.count)")
print("📝 Contains 'Thanh': \(fullName.contains("Thanh"))")
