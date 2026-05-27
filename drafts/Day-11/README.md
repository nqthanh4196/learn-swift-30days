# Day 11 - Structs vs Classes

## 📖 Giới thiệu

Struct và Class là hai cách tạo custom types trong Swift. Hiểu sự khác biệt giữa value type (struct) và reference type (class) là kiến thức nền tảng quan trọng.

---

## 🎯 Kiến thức chính

### 1. Struct (Value Type)

```swift
struct Point {
    var x: Double
    var y: Double
}
var p1 = Point(x: 1, y: 2)
var p2 = p1       // Copy!
p2.x = 10        // p1.x vẫn = 1
```

### 2. Class (Reference Type)

```swift
class Person {
    var name: String
    init(name: String) { self.name = name }
}
let a = Person(name: "Thanh")
let b = a         // Same reference!
b.name = "Minh"  // a.name cũng = "Minh"
```

### 3. Key Differences

| | Struct | Class |
|---|---|---|
| Type | Value | Reference |
| Inheritance | ❌ | ✅ |
| Deinit | ❌ | ✅ |
| Mutating | Required | Not needed |
| Default init | Memberwise | Must write |

### 4. When to use which?

- **Struct**: data models, coordinates, settings, small objects
- **Class**: shared state, inheritance needed, identity matters

---

## 📝 Tóm tắt

- Struct = value type (copy on assign)
- Class = reference type (share on assign)
- Prefer struct by default (Apple recommendation)
- Use class khi cần inheritance hoặc shared mutable state

---

## 🏋️ Challenge

Tạo BankAccount system: struct cho Transaction, class cho Account (shared state).
