// ============================================
// Day 10 - Extra Examples
// ============================================

// MARK: - Example 1: Enum with String raw values
enum APIEndpoint: String {
    case users = "/api/users"
    case posts = "/api/posts"
    case comments = "/api/comments"
    
    var url: String { "https://example.com\(rawValue)" }
}

print("🌐 \(APIEndpoint.users.url)")
print("🌐 \(APIEndpoint.posts.url)")

// MARK: - Example 2: Recursive enum
indirect enum MathExpression {
    case number(Int)
    case add(MathExpression, MathExpression)
    case multiply(MathExpression, MathExpression)
    
    func evaluate() -> Int {
        switch self {
        case .number(let n): return n
        case .add(let a, let b): return a.evaluate() + b.evaluate()
        case .multiply(let a, let b): return a.evaluate() * b.evaluate()
        }
    }
}

// (2 + 3) * 4
let expr = MathExpression.multiply(.add(.number(2), .number(3)), .number(4))
print("\n🧮 (2 + 3) * 4 = \(expr.evaluate())")

// MARK: - Example 3: CaseIterable
enum Season: String, CaseIterable {
    case spring = "🌸"
    case summer = "☀️"
    case autumn = "🍂"
    case winter = "❄️"
}

print("\nSeasons:")
Season.allCases.forEach { print("  \($0.rawValue) \($0)") }
