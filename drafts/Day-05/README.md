# Day 5 - Functions & Parameters

## 📖 Giới thiệu

Functions là khối code có thể tái sử dụng. Swift có hệ thống function rất linh hoạt với argument labels, default values, variadic parameters và nhiều hơn nữa.

---

## 🎯 Kiến thức chính

### 1. Basic Function

```swift
func greet(name: String) -> String {
    return "Hello, \(name)!"
}
print(greet(name: "Thanh"))
```

### 2. Argument Labels

```swift
func move(from source: String, to destination: String) {
    print("Moving from \(source) to \(destination)")
}
move(from: "Hanoi", to: "HCMC")
```

### 3. Default Parameters

```swift
func power(_ base: Int, exponent: Int = 2) -> Int {
    var result = 1
    for _ in 1...exponent { result *= base }
    return result
}
print(power(5))           // 25
print(power(2, exponent: 10))  // 1024
```

### 4. Variadic Parameters

```swift
func average(_ numbers: Double...) -> Double {
    let total = numbers.reduce(0, +)
    return total / Double(numbers.count)
}
print(average(1, 2, 3, 4, 5))  // 3.0
```

### 5. Inout Parameters

```swift
func swapValues(_ a: inout Int, _ b: inout Int) {
    let temp = a; a = b; b = temp
}
```

### 6. Functions as Types

```swift
func add(_ a: Int, _ b: Int) -> Int { a + b }
func multiply(_ a: Int, _ b: Int) -> Int { a * b }

var operation: (Int, Int) -> Int = add
print(operation(3, 4))  // 7
```

---

## 📝 Tóm tắt

- Functions dùng `func` keyword
- Argument labels giúp code đọc như tiếng Anh
- Default values giảm boilerplate
- `inout` cho phép modify tham số
- Functions là first-class citizens

---

## 🏋️ Challenge

Viết bộ converter nhiệt độ: Celsius ↔ Fahrenheit ↔ Kelvin
