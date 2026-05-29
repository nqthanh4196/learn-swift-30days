# Day 7 - Optionals & Optional Chaining

## 📖 Giới thiệu

Optionals là một trong những tính năng quan trọng nhất của Swift, giúp xử lý an toàn trường hợp giá trị có thể nil. Đây là cách Swift đảm bảo null safety.

---

## 🎯 Kiến thức chính

### 1. Optional Declaration

```swift
var name: String? = "Thanh"
var age: Int? = nil
```

### 2. Unwrapping

```swift
// If-let
if let unwrapped = name {
    print(unwrapped)
}

// Guard-let
guard let unwrapped = name else { return }

// Force unwrap (nguy hiểm!)
print(name!)  // Crash nếu nil

// Nil coalescing
let display = name ?? "Unknown"
```

### 3. Optional Chaining

```swift
struct Address {
    var city: String?
}
struct Person {
    var address: Address?
}

let person = Person(address: Address(city: "HCMC"))
let city = person.address?.city?.uppercased()
```

### 4. Implicitly Unwrapped Optionals

```swift
var apiKey: String! = "abc123"
// Dùng khi chắc chắn có giá trị sau init
```

---

## 📝 Tóm tắt

- Optional = giá trị có thể nil
- Luôn unwrap an toàn với `if let` hoặc `guard let`
- Optional chaining `?.` cho nested access
- Nil coalescing `??` cho default value
- Tránh force unwrap `!` trừ khi 100% chắc chắn

---

## 🏋️ Challenge

Parse user profile từ dictionary có thể thiếu fields, xử lý tất cả optional cases.
