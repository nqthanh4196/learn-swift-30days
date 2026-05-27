# Day 14 - Protocols & Protocol Extensions

## 📖 Giới thiệu

Protocols định nghĩa blueprint cho methods và properties. Protocol-oriented programming là paradigm chính của Swift, ưu tiên composition over inheritance.

---

## 🎯 Kiến thức chính

### 1. Basic Protocol

```swift
protocol Drawable {
    var color: String { get set }
    func draw()
}
```

### 2. Protocol Conformance

```swift
struct Circle: Drawable {
    var color: String
    var radius: Double
    func draw() { print("Drawing circle") }
}
```

### 3. Protocol Extensions (Default Implementation)

```swift
extension Drawable {
    func draw() { print("Drawing \(color) shape") }
}
```

### 4. Protocol Composition

```swift
protocol Named { var name: String { get } }
protocol Aged { var age: Int { get } }

func greet(_ person: Named & Aged) {
    print("\(person.name), age \(person.age)")
}
```

### 5. Associated Types

```swift
protocol Container {
    associatedtype Item
    mutating func add(_ item: Item)
    var count: Int { get }
}
```

---

## 📝 Tóm tắt

- Protocols = contracts/blueprints
- Extensions cung cấp default implementations
- Protocol composition cho flexible typing
- Prefer protocols over inheritance (POP)
- Associated types cho generic protocols

---

## 🏋️ Challenge

Tạo Shape Calculator dùng protocols: Measurable, Drawable, Printable.
