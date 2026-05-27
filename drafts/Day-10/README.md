# Day 10 - Enumerations

## 📖 Giới thiệu

Enums trong Swift cực kỳ mạnh mẽ — không chỉ là danh sách hằng số mà còn có associated values, raw values, methods và computed properties.

---

## 🎯 Kiến thức chính

### 1. Basic Enum

```swift
enum Direction {
    case north, south, east, west
}
var heading = Direction.north
```

### 2. Raw Values

```swift
enum Planet: Int {
    case mercury = 1, venus, earth, mars
}
let earth = Planet(rawValue: 3)  // .earth
```

### 3. Associated Values

```swift
enum NetworkResult {
    case success(data: String)
    case failure(error: String, code: Int)
}
```

### 4. Methods & Computed Properties

```swift
enum Temperature {
    case celsius(Double)
    case fahrenheit(Double)
    
    var inCelsius: Double {
        switch self {
        case .celsius(let c): return c
        case .fahrenheit(let f): return (f - 32) * 5/9
        }
    }
}
```

---

## 📝 Tóm tắt

- Enums define a group of related values
- Raw values cho mapping với primitive types
- Associated values cho data kèm theo mỗi case
- Enums có thể có methods, computed properties
- Pattern matching với switch rất mạnh

---

## 🏋️ Challenge

Xây dựng Weather App enum với các trạng thái thời tiết và thông tin kèm theo.
