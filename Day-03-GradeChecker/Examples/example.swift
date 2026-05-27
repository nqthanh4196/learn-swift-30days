// ============================================
// Day 03 - Extra Examples
// ============================================

// MARK: - Example 1: Switch with where clause
let numbers = [1, -2, 3, -4, 5, 0]
for num in numbers {
    switch num {
    case let x where x > 0:
        print("\(x) is positive")
    case let x where x < 0:
        print("\(x) is negative")
    default:
        print("zero")
    }
}

// MARK: - Example 2: If-let (Optional Binding)
let possibleNumber = "123"
if let number = Int(possibleNumber) {
    print("\n✅ Converted: \(number)")
} else {
    print("\n❌ Not a number")
}

// MARK: - Example 3: Multiple conditions
let username = "admin"
let password = "1234"
let isActive = true

if username == "admin", password == "1234", isActive {
    print("🔓 Login successful")
} else {
    print("🔒 Login failed")
}
