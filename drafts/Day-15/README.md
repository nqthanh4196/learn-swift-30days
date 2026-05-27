# Day 15 - Extensions

## 📖 Giới thiệu

Extensions cho phép thêm functionality vào types đã tồn tại — kể cả types bạn không sở hữu source code. Đây là công cụ cực kỳ mạnh để tổ chức code.

---

## 🎯 Kiến thức chính

### 1. Adding Methods

```swift
extension String {
    func reversed() -> String {
        String(self.reversed())
    }
}
```

### 2. Computed Properties

```swift
extension Int {
    var isEven: Bool { self % 2 == 0 }
    var squared: Int { self * self }
}
```

### 3. Protocol Conformance via Extension

```swift
extension Int: CustomStringConvertible {
    public var description: String { "\(self)" }
}
```

### 4. Organizing Code

```swift
// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource { }
```

---

## 📝 Tóm tắt

- Extensions thêm methods, computed properties, protocol conformance
- Không thể thêm stored properties
- Dùng để tổ chức code theo protocol conformance
- Có thể extend bất kỳ type nào (Int, String, Array...)

---

## 🏋️ Challenge

Tạo bộ String extensions hữu ích cho iOS development.
