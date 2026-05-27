// ============================================
// Day 01 - PlaygroundBasics
// Topic: Variables, Constants & Data Types
// ============================================

// MARK: - 1. Constants (let)
let appName = "Learn Swift 30 Days"
let version: Double = 1.0
let maxDays: Int = 30

print("📱 \(appName) v\(version)")
print("📅 Total lessons: \(maxDays)")
print("")

// MARK: - 2. Variables (var)
var currentDay = 1
var progress = 0.0

print("🚀 Starting Day \(currentDay)")
progress = Double(currentDay) / Double(maxDays) * 100
print("📊 Progress: \(progress)%")
print("")

// MARK: - 3. Data Types
let name: String = "Nguyễn Quốc Thanh"
let age: Int = 25
let height: Double = 1.72
let isIOSDeveloper: Bool = true
let initial: Character = "T"

print("👤 Profile:")
print("   Name: \(name)")
print("   Age: \(age)")
print("   Height: \(height)m")
print("   iOS Developer: \(isIOSDeveloper)")
print("   Initial: \(initial)")
print("")

// MARK: - 4. Type Inference
let city = "Ho Chi Minh"       // Swift infers String
let temperature = 32.5         // Swift infers Double
let numberOfApps = 3           // Swift infers Int
let isRaining = false          // Swift infers Bool

print("🌤️ Weather in \(city): \(temperature)°C, Raining: \(isRaining)")
print("")

// MARK: - 5. Type Conversion
let score: Int = 95
let scoreAsDouble = Double(score)
let message = "Score: " + String(score)

print("🎯 \(message)")
print("   As Double: \(scoreAsDouble)")
print("")

// MARK: - 6. Multiple declarations
let x = 1, y = 2, z = 3
var a = 10, b = 20

print("📐 Coordinates: (\(x), \(y), \(z))")
print("   a = \(a), b = \(b)")

// Swap values
a = a + b
b = a - b
a = a - b
print("   After swap: a = \(a), b = \(b)")
