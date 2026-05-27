// ============================================
// Day 14 - ShapeCalculator
// Topic: Protocols & Protocol Extensions
// ============================================

// MARK: - Protocols
protocol Shape {
    var name: String { get }
    func area() -> Double
    func perimeter() -> Double
}

protocol Printable {
    func printInfo()
}

// MARK: - Protocol Extension (Default Implementation)
extension Shape {
    func printInfo() {
        print("  \(name): area=\(String(format: "%.2f", area())), perimeter=\(String(format: "%.2f", perimeter()))")
    }
}

extension Shape where Self: Printable {
    func compare(to other: Shape) -> String {
        if area() > other.area() { return "\(name) is larger" }
        if area() < other.area() { return "\(other.name) is larger" }
        return "Same area"
    }
}

// MARK: - Shapes
struct Circle: Shape, Printable {
    let name = "Circle"
    let radius: Double
    func area() -> Double { .pi * radius * radius }
    func perimeter() -> Double { 2 * .pi * radius }
}

struct Rectangle: Shape, Printable {
    let name = "Rectangle"
    let width: Double
    let height: Double
    func area() -> Double { width * height }
    func perimeter() -> Double { 2 * (width + height) }
}

struct Triangle: Shape, Printable {
    let name = "Triangle"
    let a: Double, b: Double, c: Double
    let base: Double, height: Double
    func area() -> Double { 0.5 * base * height }
    func perimeter() -> Double { a + b + c }
}

// MARK: - Calculator
struct ShapeCalculator {
    private var shapes: [Shape] = []
    
    mutating func add(_ shape: Shape) {
        shapes.append(shape)
    }
    
    var totalArea: Double {
        shapes.reduce(0) { $0 + $1.area() }
    }
    
    var totalPerimeter: Double {
        shapes.reduce(0) { $0 + $1.perimeter() }
    }
    
    func largest() -> Shape? {
        shapes.max(by: { $0.area() < $1.area() })
    }
    
    func printAll() {
        print("📐 All Shapes (\(shapes.count)):")
        shapes.forEach { $0.printInfo() }
    }
}

// MARK: - Demo
print("📐 Shape Calculator")
print("================================\n")

var calc = ShapeCalculator()
calc.add(Circle(radius: 5))
calc.add(Rectangle(width: 4, height: 6))
calc.add(Triangle(a: 3, b: 4, c: 5, base: 4, height: 3))
calc.add(Circle(radius: 3))

calc.printAll()

print("\n📊 Summary:")
print("  Total area: \(String(format: "%.2f", calc.totalArea))")
print("  Total perimeter: \(String(format: "%.2f", calc.totalPerimeter))")
if let largest = calc.largest() {
    print("  Largest: \(largest.name) (\(String(format: "%.2f", largest.area())))")
}

// Compare
let c1 = Circle(radius: 5)
let r1 = Rectangle(width: 8, height: 10)
print("\n🔄 \(c1.compare(to: r1))")
