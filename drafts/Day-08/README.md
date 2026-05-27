# Day 8 - Arrays & Sets

## 📖 Giới thiệu

Arrays và Sets là hai collection types cơ bản trong Swift. Array lưu trữ phần tử có thứ tự, Set lưu trữ phần tử duy nhất không trùng lặp.

---

## 🎯 Kiến thức chính

### 1. Arrays

```swift
var fruits = ["Apple", "Banana", "Orange"]
fruits.append("Mango")
fruits.insert("Grape", at: 1)
fruits.remove(at: 0)
print(fruits.count)
print(fruits.first ?? "empty")
```

### 2. Array Operations

```swift
let numbers = [3, 1, 4, 1, 5, 9]
let sorted = numbers.sorted()
let reversed = numbers.reversed()
let contains5 = numbers.contains(5)
let sum = numbers.reduce(0, +)
```

### 3. Sets

```swift
var skills: Set<String> = ["Swift", "UIKit", "SwiftUI"]
skills.insert("Combine")
skills.remove("UIKit")
print(skills.contains("Swift"))  // true
```

### 4. Set Operations

```swift
let setA: Set = [1, 2, 3, 4, 5]
let setB: Set = [4, 5, 6, 7, 8]

let union = setA.union(setB)
let intersection = setA.intersection(setB)
let difference = setA.subtracting(setB)
```

---

## 📝 Tóm tắt

- Array: ordered, allows duplicates, index-based access
- Set: unordered, unique elements, fast lookup O(1)
- Cả hai đều là value types (struct)
- Dùng Set khi cần unique elements hoặc fast membership test

---

## 🏋️ Challenge

Viết Shopping List app: thêm, xóa, tìm kiếm, sắp xếp items.
