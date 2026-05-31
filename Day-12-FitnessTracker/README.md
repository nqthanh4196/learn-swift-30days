# Day 12 - Properties & Methods

## 📖 Giới thiệu

Properties lưu trữ giá trị, methods thực hiện hành động. Swift có stored properties, computed properties, property observers, static properties và nhiều loại methods.

---

## 🎯 Kiến thức chính

### 1. Stored & Computed Properties

```swift
struct Circle {
    var radius: Double  // stored
    var area: Double {  // computed
        return .pi * radius * radius
    }
}
```

### 2. Property Observers

```swift
var score: Int = 0 {
    willSet { print("Will change to \(newValue)") }
    didSet { print("Changed from \(oldValue)") }
}
```

### 3. Lazy Properties

```swift
lazy var expensiveData = loadData()
```

### 4. Static Properties & Methods

```swift
struct App {
    static let version = "1.0"
    static func reset() { }
}
```

### 5. Instance Methods & Mutating

```swift
struct Stack<T> {
    private var items: [T] = []
    mutating func push(_ item: T) { items.append(item) }
    mutating func pop() -> T? { items.popLast() }
}
```

---

## 📝 Tóm tắt

- Stored properties lưu giá trị, computed properties tính toán
- Property observers theo dõi thay đổi (willSet/didSet)
- Lazy properties khởi tạo khi truy cập lần đầu
- Static thuộc về type, không thuộc instance
- Struct methods thay đổi self cần `mutating`

---

## 🏋️ Challenge

Xây dựng FitnessTracker: track steps, calories, distance với property observers.
