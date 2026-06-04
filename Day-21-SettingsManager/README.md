# Day 21 - Property Wrappers & Result Builders

## 📖 Giới thiệu

Property Wrappers cho phép tái sử dụng logic cho properties. Result Builders tạo DSL (Domain Specific Language) cho Swift. Cả hai là advanced features dùng nhiều trong SwiftUI.

---

## 🎯 Kiến thức chính

### Property Wrappers

```swift
@propertyWrapper
struct Clamped {
    var wrappedValue: Int {
        didSet { wrappedValue = min(max(wrappedValue, range.lowerBound), range.upperBound) }
    }
    let range: ClosedRange<Int>
}
```

### Result Builders

```swift
@resultBuilder
struct ArrayBuilder {
    static func buildBlock(_ components: Int...) -> [Int] { components }
}
```

---

## 📝 Tóm tắt

- `@propertyWrapper` encapsulate property logic
- `projectedValue` ($property) cho extra info
- `@resultBuilder` tạo custom DSL
- SwiftUI dùng cả hai rất nhiều (@State, @ViewBuilder)
