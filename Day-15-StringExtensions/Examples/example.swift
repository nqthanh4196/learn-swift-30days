// ============================================
// Day 15 - Extra Examples
// ============================================

// MARK: - Example 1: Date extension
extension Date {
    var isToday: Bool { Calendar.current.isDateInToday(self) }
    var isWeekend: Bool { Calendar.current.isDateInWeekend(self) }
}

print("Today is weekend: \(Date().isWeekend)")

// MARK: - Example 2: Double extension
extension Double {
    var celsius: String { String(format: "%.1f°C", self) }
    var fahrenheit: String { String(format: "%.1f°F", self * 9/5 + 32) }
    var currency: String { String(format: "%.0f VND", self) }
}

print("\n32.5 celsius: \(32.5.celsius)")
print("32.5 fahrenheit: \(32.5.fahrenheit)")
print("1500000 currency: \(1500000.0.currency)")

// MARK: - Example 3: Optional extension
extension Optional where Wrapped == String {
    var orEmpty: String { self ?? "" }
    var isNilOrEmpty: Bool { self?.isEmpty ?? true }
}

let name: String? = nil
print("\nnil orEmpty: '\(name.orEmpty)'")
print("nil isNilOrEmpty: \(name.isNilOrEmpty)")
