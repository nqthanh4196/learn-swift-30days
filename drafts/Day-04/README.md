# Day 4 - Loops (for, while, repeat-while)

## 📖 Giới thiệu

Vòng lặp giúp thực thi code nhiều lần. Swift cung cấp 3 loại vòng lặp: `for-in`, `while`, và `repeat-while`. Hôm nay bạn sẽ thành thạo cả 3.

---

## 🎯 Kiến thức chính

### 1. For-in Loop

```swift
// Lặp qua range
for i in 1...5 {
    print(i)
}

// Lặp qua array
let fruits = ["🍎", "🍌", "🍊"]
for fruit in fruits {
    print(fruit)
}

// Bỏ qua biến với _
for _ in 1...3 {
    print("Hello!")
}
```

### 2. While Loop

```swift
var countdown = 5
while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}
print("🚀 Launch!")
```

### 3. Repeat-While (do-while)

```swift
var number = 1
repeat {
    print(number)
    number *= 2
} while number < 100
```

### 4. Loop Control

```swift
// break - thoát vòng lặp
// continue - bỏ qua iteration hiện tại
for i in 1...10 {
    if i == 3 { continue }  // skip 3
    if i == 8 { break }     // stop at 8
    print(i)
}
```

### 5. Stride

```swift
// Đếm cách quãng
for i in stride(from: 0, to: 50, by: 10) {
    print(i)  // 0, 10, 20, 30, 40
}
```

---

## 📝 Tóm tắt

- `for-in` dùng cho range, array, dictionary
- `while` kiểm tra điều kiện trước
- `repeat-while` thực thi ít nhất 1 lần
- `break` và `continue` điều khiển flow
- `stride` cho bước nhảy tùy chỉnh

---

## 🏋️ Challenge

Viết chương trình in bảng cửu chương từ 2 đến 9, format đẹp.
