# Day 9 - Dictionaries & Tuples

## 📖 Giới thiệu

Dictionary lưu trữ cặp key-value, Tuple nhóm nhiều giá trị thành một. Cả hai đều cực kỳ hữu ích khi làm việc với dữ liệu có cấu trúc.

---

## 🎯 Kiến thức chính

### 1. Dictionary

```swift
var contacts: [String: String] = [
    "Thanh": "0901234567",
    "Minh": "0912345678"
]
contacts["Lan"] = "0923456789"  // Add
contacts["Thanh"] = nil         // Remove
```

### 2. Dictionary Operations

```swift
for (name, phone) in contacts {
    print("\(name): \(phone)")
}
let names = Array(contacts.keys)
let phones = Array(contacts.values)
```

### 3. Tuples

```swift
let person = (name: "Thanh", age: 25, city: "HCMC")
print(person.name)
print(person.1)  // age by index

// Decompose
let (name, age, _) = person
```

### 4. Function returning Tuple

```swift
func getMinMax(_ array: [Int]) -> (min: Int, max: Int) {
    return (array.min()!, array.max()!)
}
```

---

## 📝 Tóm tắt

- Dictionary: key-value pairs, keys must be Hashable
- Access returns Optional (key might not exist)
- Tuples: lightweight grouping of values
- Tuples great for returning multiple values from functions

---

## 🏋️ Challenge

Xây dựng Contact Book: thêm, tìm, xóa, nhóm theo chữ cái đầu.
