# Day 3 - Control Flow (if/else, switch)

## 📖 Giới thiệu

Control flow cho phép chương trình đưa ra quyết định dựa trên điều kiện. Hôm nay bạn sẽ học `if/else` và `switch` — hai cấu trúc điều khiển quan trọng nhất trong Swift.

---

## 🎯 Kiến thức chính

### 1. If / Else

```swift
let score = 85

if score >= 90 {
    print("Excellent!")
} else if score >= 70 {
    print("Good!")
} else {
    print("Need improvement")
}
```

### 2. Switch Statement

Switch trong Swift rất mạnh — không cần `break`, hỗ trợ pattern matching:

```swift
let grade = "A"

switch grade {
case "A":
    print("Xuất sắc")
case "B", "C":
    print("Khá - Trung bình")
case "D":
    print("Yếu")
default:
    print("Không hợp lệ")
}
```

### 3. Switch với Range

```swift
let temperature = 32

switch temperature {
case ..<0:
    print("Freezing")
case 0..<15:
    print("Cold")
case 15..<25:
    print("Comfortable")
case 25..<35:
    print("Hot")
default:
    print("Very hot!")
}
```

### 4. Guard Statement

`guard` giúp early exit khi điều kiện không thỏa:

```swift
func processAge(_ age: Int?) {
    guard let age = age, age >= 18 else {
        print("Invalid or underage")
        return
    }
    print("Welcome! Age: \(age)")
}
```

---

## 📝 Tóm tắt

- `if/else` cho điều kiện đơn giản
- `switch` cho nhiều trường hợp, hỗ trợ range và pattern matching
- `guard` cho early exit, giúp code sạch hơn
- Swift switch không cần `break`, dùng `fallthrough` nếu muốn

---

## 🏋️ Challenge

Viết chương trình GradeChecker: nhận điểm số (0-100), in ra xếp loại và emoji tương ứng.
