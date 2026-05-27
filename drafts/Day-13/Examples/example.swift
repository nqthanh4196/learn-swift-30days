// ============================================
// Day 13 - Extra Examples
// ============================================

// MARK: - Example 1: Required init
class Shape {
    var name: String
    required init(name: String) { self.name = name }
    func area() -> Double { 0 }
}

class Square: Shape {
    var side: Double
    init(side: Double) {
        self.side = side
        super.init(name: "Square")
    }
    required init(name: String) { self.side = 1; super.init(name: name) }
    override func area() -> Double { side * side }
}

let s = Square(side: 5)
print("\(s.name) area: \(s.area())")

// MARK: - Example 2: Deinit
class FileHandle {
    let filename: String
    init(filename: String) {
        self.filename = filename
        print("📂 Opened: \(filename)")
    }
    deinit { print("📂 Closed: \(filename)") }
}

if true {
    let _ = FileHandle(filename: "data.txt")
}
// deinit called here

// MARK: - Example 3: Type checking
func printType(_ obj: Any) {
    switch obj {
    case is Int: print("  Integer")
    case is String: print("  String")
    case is Double: print("  Double")
    default: print("  Unknown")
    }
}

print("\nType checking:")
[42, "hello", 3.14].forEach { printType($0) }
