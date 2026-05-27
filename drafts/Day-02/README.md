# Day 2 - Operators & String Interpolation

## 📖 Giới thiệu

Hôm nay chúng ta sẽ học về các toán tử (operators) trong Swift và cách sử dụng String Interpolation để tạo chuỗi động — hai kỹ năng thiết yếu bạn sẽ dùng hàng ngày khi code.

---

## 🎯 Kiến thức chính

### 1. Arithmetic Operators (Toán tử số học)

```swift
let a = 10, b = 3
print(a + b)   // 13 - Cộng
print(a - b)   // 7  - Trừ
print(a * b)   // 30 - Nhân
print(a / b)   // 3  - Chia (integer division)
print(a % b)   // 1  - Chia lấy dư
```

### 2. Comparison Operators (Toán tử so sánh)

```swift
print(5 == 5)   // true
print(5 != 3)   // true
print(5 > 3)    // true
print(5 < 3)    // false
print(5 >= 5)   // true
print(5 <= 4)   // false
```

### 3. Logical Operators (Toán tử logic)

```swift
let isAdult = true
let hasID = false

print(!isAdult)           // false (NOT)
print(isAdult && hasID)   // false (AND)
print(isAdult || hasID)   // true  (OR)
```

### 4. Compound Assignment Operators

```swift
var score = 100
score += 10   // score = 110
score -= 5    // score = 105
score *= 2    // score = 210
score /= 3    // score = 70
```

### 5. String Interpolation

```swift
let name = "Thanh"
let age = 25
let height = 1.72

// Cơ bản
print("Hello, \(name)!")

// Biểu thức trong interpolation
print("Next year you'll be \(age + 1)")

// Format số thực
print("Height: \(String(format: "%.1f", height))m")
```

### 6. Multiline Strings

```swift
let poem = """
    Swift is fast,
    Swift is safe,
    Swift is \(name)'s favorite!
    """
```

---

## 📝 Tóm tắt

- Swift hỗ trợ đầy đủ toán tử: số học, so sánh, logic, gán kết hợp
- String Interpolation dùng `\(expression)` để nhúng giá trị vào chuỗi
- Multiline strings dùng `"""`
- Ternary operator `condition ? a : b` giúp code ngắn gọn

---

## 🏋️ Challenge

Viết chương trình tính BMI:
1. Nhận weight (kg) và height (m)
2. Tính BMI = weight / (height * height)
3. In kết quả với String Interpolation, format 1 chữ số thập phân
