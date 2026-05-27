# Day 16 - Generics

## 📖 Giới thiệu

Generics cho phép viết code linh hoạt, tái sử dụng được với nhiều types khác nhau mà vẫn đảm bảo type safety. Đây là tính năng mạnh mẽ nhất của Swift.

---

## 🎯 Kiến thức chính

### 1. Generic Functions

```swift
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a; a = b; b = temp
}
```

### 2. Generic Types

```swift
struct Stack<Element> {
    private var items: [Element] = []
    mutating func push(_ item: Element) { items.append(item) }
    mutating func pop() -> Element? { items.popLast() }
}
```

### 3. Type Constraints

```swift
func findIndex<T: Equatable>(of value: T, in array: [T]) -> Int? {
    array.firstIndex(of: value)
}
```

### 4. Where Clauses

```swift
func allEqual<T: Equatable>(_ array: [T]) -> Bool where T: Comparable {
    guard let first = array.first else { return true }
    return array.allSatisfy { $0 == first }
}
```

---

## 📝 Tóm tắt

- Generics = write once, use with any type
- Type parameters `<T>` là placeholder cho actual types
- Constraints (`T: Protocol`) giới hạn types được phép
- Where clauses cho complex constraints
- Swift standard library dùng generics rất nhiều (Array, Optional, Result...)

---

## 🏋️ Challenge

Implement generic Stack với push, pop, peek, isEmpty, count.
