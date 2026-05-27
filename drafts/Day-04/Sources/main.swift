// ============================================
// Day 04 - MultiplicationTable
// Topic: Loops (for, while, repeat-while)
// ============================================

// MARK: - 1. Multiplication Table
print("📐 Bảng Cửu Chương")
print("================================")

for table in 2...9 {
    print("\n🔢 Bảng \(table):")
    for i in 1...10 {
        let result = table * i
        print("  \(table) x \(i) = \(result)")
    }
}
print("")

// MARK: - 2. While loop - Guessing game simulation
print("🎮 Number Guessing Simulation")
let secretNumber = 7
var guess = 1
var attempts = 0

while guess != secretNumber {
    attempts += 1
    guess = Int.random(in: 1...10)
    print("  Attempt \(attempts): guessed \(guess)")
}
print("  ✅ Found \(secretNumber) in \(attempts) attempts!")
print("")

// MARK: - 3. Repeat-while - Dice roller
print("🎲 Roll until 6:")
var roll = 0
var rollCount = 0
repeat {
    roll = Int.random(in: 1...6)
    rollCount += 1
    print("  Roll \(rollCount): \(roll)")
} while roll != 6
print("  🎉 Got 6 after \(rollCount) rolls!")
print("")

// MARK: - 4. Nested loops - Pattern
print("⭐ Star Pattern:")
for row in 1...5 {
    var line = ""
    for _ in 1...row {
        line += "⭐"
    }
    print("  \(line)")
}
print("")

// MARK: - 5. Stride
print("📊 Temperature conversion (0-100°C, step 20):")
for celsius in stride(from: 0, through: 100, by: 20) {
    let fahrenheit = celsius * 9 / 5 + 32
    print("  \(celsius)°C = \(fahrenheit)°F")
}
print("")

// MARK: - 6. Break & Continue
print("🔍 Find first number divisible by both 3 and 7:")
for i in 1...100 {
    if i % 3 != 0 { continue }
    if i % 7 == 0 {
        print("  Found: \(i)")
        break
    }
}
