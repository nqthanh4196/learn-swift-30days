// ============================================
// Day 11 - Extra Examples
// ============================================

// MARK: - Example 1: Mutating in struct
struct Counter {
    var count = 0
    mutating func increment() { count += 1 }
    mutating func reset() { count = 0 }
}

var c = Counter()
c.increment()
c.increment()
print("Counter: \(c.count)")

// MARK: - Example 2: Identity check (===)
class Dog {
    var name: String
    init(name: String) { self.name = name }
}

let dog1 = Dog(name: "Rex")
let dog2 = dog1
let dog3 = Dog(name: "Rex")

print("\ndog1 === dog2: \(dog1 === dog2)")  // true (same instance)
print("dog1 === dog3: \(dog1 === dog3)")  // false (different instance)

// MARK: - Example 3: Struct with custom init
struct Color {
    let red: Double, green: Double, blue: Double
    
    init(hex: String) {
        var hexStr = hex.trimmingCharacters(in: .init(charactersIn: "#"))
        let scanner = Scanner(string: hexStr)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        red = Double((rgb >> 16) & 0xFF) / 255.0
        green = Double((rgb >> 8) & 0xFF) / 255.0
        blue = Double(rgb & 0xFF) / 255.0
    }
}

let color = Color(hex: "#FF5733")
print("\nColor RGB: (\(color.red), \(color.green), \(color.blue))")
