// ============================================
// Day 15 - StringExtensions
// Topic: Extensions
// ============================================

// MARK: - String Extensions
extension String {
    var isEmail: Bool {
        contains("@") && contains(".") && count > 5
    }
    
    var isPhoneNumber: Bool {
        let digits = filter { $0.isNumber }
        return digits.count >= 10 && digits.count <= 11
    }
    
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var wordCount: Int {
        split(separator: " ").count
    }
    
    func truncated(to length: Int, trailing: String = "...") -> String {
        if count <= length { return self }
        return String(prefix(length)) + trailing
    }
    
    var camelCaseToWords: String {
        unicodeScalars.reduce("") { result, scalar in
            if scalar.properties.isUppercase && !result.isEmpty {
                return result + " " + String(scalar)
            }
            return result + String(scalar)
        }
    }
    
    func masked(showLast: Int = 4) -> String {
        if count <= showLast { return self }
        let mask = String(repeating: "*", count: count - showLast)
        return mask + suffix(showLast)
    }
}

// MARK: - Int Extensions
extension Int {
    var isEven: Bool { self % 2 == 0 }
    var isOdd: Bool { !isEven }
    
    var formatted: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
    
    func times(_ action: (Int) -> Void) {
        for i in 0..<self { action(i) }
    }
}

// MARK: - Array Extensions
extension Array where Element: Numeric {
    var sum: Element { reduce(0, +) }
}

extension Array {
    var second: Element? { count > 1 ? self[1] : nil }
    
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

// MARK: - Demo
print("🧩 String Extensions")
print("================================\n")

let email = "thanh@example.com"
let phone = "0901 234 567"
let text = "  Hello World  "
let longText = "This is a very long description that needs truncation"
let camel = "backgroundColor"
let cardNumber = "4532015112830366"

print("📧 '\(email)' is email: \(email.isEmail)")
print("📱 '\(phone)' is phone: \(phone.isPhoneNumber)")
print("✂️ Trimmed: '\(text.trimmed)'")
print("📏 Word count: \(longText.wordCount)")
print("📝 Truncated: \(longText.truncated(to: 20))")
print("🐫 camelCase: \(camel.camelCaseToWords)")
print("🔒 Masked card: \(cardNumber.masked())")

print("\n🔢 Int Extensions:")
print("42 is even: \(42.isEven)")
print("1000000 formatted: \(1000000.formatted)")
3.times { print("  Iteration \($0)") }

print("\n📦 Array Extensions:")
print("[1,2,3,4,5] sum: \([1, 2, 3, 4, 5].sum)")
print("[1,2,3,4,5] second: \([1, 2, 3, 4, 5].second ?? 0)")
print("Chunked by 2: \([1, 2, 3, 4, 5].chunked(into: 2))")
