# Day 1 - Variables, Constants & Data Types

## 📖 Giới thiệu

Đây là bài học đầu tiên trong hành trình 30 ngày học Swift. Hôm nay chúng ta sẽ tìm hiểu về biến (variables), hằng số (constants) và các kiểu dữ liệu cơ bản trong Swift — nền tảng quan trọng nhất của mọi chương trình.

---

## 🎯 Kiến thức chính

### 1. Variables (Biến) - `var`

Biến là nơi lưu trữ dữ liệu có thể thay đổi giá trị sau khi khai báo.

```swift
var name = "Thanh"
name = "Quốc Thanh"  // ✅ Có thể thay đổi
```

### 2. Constants (Hằng số) - `let`

Hằng số là giá trị không thể thay đổi sau khi gán.

```swift
let pi = 3.14159
// pi = 3.14  // ❌ Lỗi: Cannot assign to value
```

> 💡 **Best Practice:** Luôn dùng `let` trước, chỉ đổi sang `var` khi thực sự cần thay đổi giá trị.

### 3. Các kiểu dữ liệu cơ bản

| Type | Mô tả | Ví dụ |
|------|--------|-------|
| `Int` | Số nguyên | `42` |
| `Double` | Số thực (64-bit) | `3.14` |
| `Float` | Số thực (32-bit) | `3.14` |
| `String` | Chuỗi ký tự | `"Hello"` |
| `Bool` | Đúng/Sai | `true`, `false` |
| `Character` | Một ký tự | `"A"` |

### 4. Type Annotation (Khai báo kiểu)

Swift có **Type Inference** (tự suy luận kiểu), nhưng bạn cũng có thể khai báo rõ ràng:

```swift
let age: Int = 25
let height: Double = 1.75
let isStudent: Bool = true
```

### 5. Type Safety

Swift là ngôn ngữ **type-safe** — không thể gán giá trị sai kiểu:

```swift
var score: Int = 100
// score = "high"  // ❌ Lỗi: Cannot assign String to Int
```

---

## 📝 Tóm tắt

- `var` để khai báo biến (có thể thay đổi)
- `let` để khai báo hằng số (không thể thay đổi)
- Swift có các kiểu cơ bản: `Int`, `Double`, `String`, `Bool`
- Swift tự suy luận kiểu (Type Inference)
- Swift là type-safe, đảm bảo an toàn kiểu dữ liệu

---

## 🏋️ Challenge

Tạo một chương trình khai báo thông tin cá nhân của bạn:
1. Tên (String, let)
2. Tuổi (Int, var)
3. Chiều cao (Double, let)
4. Đang là sinh viên? (Bool, var)
5. In ra tất cả thông tin bằng `print()`
