// ============================================
// Day 21 - SettingsManager
// Topic: Property Wrappers & Result Builders
// ============================================

// MARK: - Property Wrappers
@propertyWrapper
struct Clamped<T: Comparable> {
    private var value: T
    let range: ClosedRange<T>
    
    var wrappedValue: T {
        get { value }
        set { value = min(max(newValue, range.lowerBound), range.upperBound) }
    }
    
    init(wrappedValue: T, _ range: ClosedRange<T>) {
        self.range = range
        self.value = min(max(wrappedValue, range.lowerBound), range.upperBound)
    }
}

@propertyWrapper
struct Trimmed {
    private var value: String = ""
    var wrappedValue: String {
        get { value }
        set { value = newValue.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
    init(wrappedValue: String) { self.wrappedValue = wrappedValue }
}

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    var wrappedValue: T {
        get { storage[key] as? T ?? defaultValue }
        set { storage[key] = newValue }
    }
    
    // Simulated storage
    private var storage: [String: Any] = [:]
}

// MARK: - Settings using Property Wrappers
struct AppSettings {
    @Clamped(0...100) var volume: Int = 50
    @Clamped(1...5) var difficulty: Int = 3
    @Trimmed var username: String = ""
    @Clamped(10...72) var fontSize: Int = 16
    
    func display() {
        print("  Volume: \(volume)")
        print("  Difficulty: \(difficulty)")
        print("  Username: '\(username)'")
        print("  Font size: \(fontSize)")
    }
}

// MARK: - Result Builder
@resultBuilder
struct SettingsBuilder {
    static func buildBlock(_ components: String...) -> [String] { components }
    static func buildOptional(_ component: [String]?) -> [String] { component ?? [] }
    static func buildEither(first component: [String]) -> [String] { component }
    static func buildEither(second component: [String]) -> [String] { component }
}

func buildMenu(@SettingsBuilder content: () -> [String]) -> [String] {
    content()
}

// MARK: - Demo
print("⚙️ Settings Manager")
print("================================\n")

var settings = AppSettings()
settings.volume = 150  // Clamped to 100
settings.difficulty = 0  // Clamped to 1
settings.username = "  Thanh  "  // Trimmed
settings.fontSize = 100  // Clamped to 72

print("📋 Current Settings:")
settings.display()

print("\n📋 Result Builder Menu:")
let isDarkMode = true
let menu = buildMenu {
    "General"
    "Display"
    if isDarkMode { "Dark Mode: ON" } else { "Dark Mode: OFF" }
    "About"
}
menu.enumerated().forEach { print("  \($0.offset + 1). \($0.element)") }
