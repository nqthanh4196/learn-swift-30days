// ============================================
// Day 07 - Extra Examples
// ============================================

// MARK: - Example 1: Optional map & flatMap
let stringNumber: String? = "42"
let mapped = stringNumber.map { Int($0) }   // Optional(Optional(42))
let flatMapped = stringNumber.flatMap { Int($0) }  // Optional(42)
print("map: \(String(describing: mapped))")
print("flatMap: \(String(describing: flatMapped))")

// MARK: - Example 2: Multiple optional binding
let firstName: String? = "Quốc"
let lastName: String? = "Thanh"
let userAge: Int? = 25

if let first = firstName, let last = lastName, let age = userAge {
    print("\n\(first) \(last), age \(age)")
}

// MARK: - Example 3: Optional in collections
let responses: [String?] = ["OK", nil, "Error", nil, "OK"]
let validResponses = responses.compactMap { $0 }
print("\nValid responses: \(validResponses)")
print("Count: \(validResponses.count) / \(responses.count)")
