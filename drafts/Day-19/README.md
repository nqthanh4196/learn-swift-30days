# Day 19 - Memory Management (ARC)

## 📖 Giới thiệu

Swift dùng Automatic Reference Counting (ARC) để quản lý bộ nhớ. Hiểu ARC giúp tránh memory leaks — một trong những bugs khó debug nhất trong iOS development.

---

## 🎯 Kiến thức chính

### 1. Strong References (default)

```swift
class Person {
    let name: String
    init(name: String) { self.name = name }
    deinit { print("\(name) deallocated") }
}
var person: Person? = Person(name: "Thanh")
person = nil  // deinit called
```

### 2. Retain Cycle (Memory Leak)

```swift
class A { var b: B? }
class B { var a: A? }
// a.b = b; b.a = a → Neither gets deallocated!
```

### 3. Weak References

```swift
class Apartment {
    weak var tenant: Person?  // Won't prevent deallocation
}
```

### 4. Unowned References

```swift
class CreditCard {
    unowned let owner: Person  // Always has value, won't retain
}
```

### 5. Closures & Capture Lists

```swift
class ViewController {
    var name = "Main"
    lazy var greeting: () -> String = { [weak self] in
        return "Hello from \(self?.name ?? "")"
    }
}
```

---

## 📝 Tóm tắt

- ARC tự đếm references, dealloc khi count = 0
- Strong reference cycles → memory leak
- `weak` cho optional references (có thể nil)
- `unowned` cho non-optional (crash nếu nil)
- Closures: dùng `[weak self]` để tránh retain cycle
