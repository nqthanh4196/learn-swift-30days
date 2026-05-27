// Day 18 - Extra Examples

// Singleton pattern with private init
class AppConfig {
    static let shared = AppConfig()
    private init() {}
    
    private(set) var theme = "light"
    private(set) var language = "vi"
    
    func setTheme(_ theme: String) { self.theme = theme }
    func setLanguage(_ lang: String) { self.language = lang }
}

let config = AppConfig.shared
config.setTheme("dark")
print("Theme: \(config.theme)")
// config.theme = "light"  // ❌ Cannot assign - private(set)
// let c2 = AppConfig()    // ❌ Cannot init - private init
