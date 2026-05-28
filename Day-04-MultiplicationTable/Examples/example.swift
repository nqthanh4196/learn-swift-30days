// ============================================
// Day 04 - Extra Examples
// ============================================

// MARK: - Example 1: Labeled loops
print("🏷️ Labeled loop - Find pair summing to 10:")
outerLoop: for i in 1...9 {
    for j in (i+1)...9 {
        if i + j == 10 {
            print("  \(i) + \(j) = 10")
            break outerLoop
        }
    }
}

// MARK: - Example 2: Enumerate
let languages = ["Swift", "Kotlin", "Dart", "Rust"]
print("\n📋 Languages:")
for (index, lang) in languages.enumerated() {
    print("  \(index + 1). \(lang)")
}

// MARK: - Example 3: FizzBuzz
print("\n🎯 FizzBuzz (1-20):")
for i in 1...20 {
    if i % 15 == 0 {
        print("  FizzBuzz", terminator: "")
    } else if i % 3 == 0 {
        print("  Fizz", terminator: "")
    } else if i % 5 == 0 {
        print("  Buzz", terminator: "")
    } else {
        print("  \(i)", terminator: "")
    }
}
print("")
