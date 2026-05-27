# Day 6 - Closures

## 📖 Giới thiệu

Closures là các khối code tự chứa (self-contained) có thể truyền đi và sử dụng trong code. Chúng tương tự lambda trong các ngôn ngữ khác. Closures là nền tảng của lập trình hàm trong Swift.

---

## 🎯 Kiến thức chính

### 1. Closure Syntax

```swift
// Full syntax
let greet = { (name: String) -> String in
    return "Hello, \(name)!"
}

// Shortened
let add: (Int, Int) -> Int = { $0 + $1 }
```

### 2. Trailing Closure

```swift
let names = ["Thanh", "Minh", "Lan"]
let sorted = names.sorted { $0 < $1 }
```

### 3. Map, Filter, Reduce

```swift
let numbers = [1, 2, 3, 4, 5]
let doubled = numbers.map { $0 * 2 }
let evens = numbers.filter { $0 % 2 == 0 }
let sum = numbers.reduce(0, +)
```

### 4. Capturing Values

```swift
func makeIncrementer(by amount: Int) -> () -> Int {
    var total = 0
    return {
        total += amount
        return total
    }
}
```

### 5. Escaping Closures

```swift
func fetchData(completion: @escaping (String) -> Void) {
    DispatchQueue.main.async {
        completion("Data loaded")
    }
}
```

---

## 📝 Tóm tắt

- Closures là anonymous functions
- Trailing closure syntax giúp code gọn
- `map`, `filter`, `reduce` là higher-order functions phổ biến
- Closures capture values từ context xung quanh
- `@escaping` cho closures sống lâu hơn function scope

---

## 🏋️ Challenge

Viết app sắp xếp danh sách sinh viên theo nhiều tiêu chí dùng closures.
