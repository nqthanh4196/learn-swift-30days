# Day 13 - Inheritance & Polymorphism

## 📖 Giới thiệu

Inheritance cho phép class con kế thừa properties và methods từ class cha. Polymorphism cho phép đối tượng thể hiện nhiều hình thái khác nhau.

---

## 🎯 Kiến thức chính

### 1. Basic Inheritance

```swift
class Vehicle {
    var speed: Double = 0
    func describe() -> String { "Vehicle at \(speed) km/h" }
}

class Car: Vehicle {
    var gear: Int = 1
    override func describe() -> String { "Car in gear \(gear)" }
}
```

### 2. Override & Super

```swift
class ElectricCar: Car {
    var batteryLevel: Double = 100
    override func describe() -> String {
        return super.describe() + ", battery: \(batteryLevel)%"
    }
}
```

### 3. Final (prevent override)

```swift
final class Singleton { }
// Cannot be subclassed
```

### 4. Type Casting

```swift
let vehicles: [Vehicle] = [Car(), ElectricCar()]
for v in vehicles {
    if let car = v as? Car { print(car.gear) }
}
```

---

## 📝 Tóm tắt

- `class Child: Parent` để kế thừa
- `override` để ghi đè method/property
- `super` để gọi implementation của parent
- `final` ngăn kế thừa/override
- `is`, `as?`, `as!` cho type casting

---

## 🏋️ Challenge

Xây dựng Vehicle hierarchy: Vehicle → Car, Motorcycle, Truck với polymorphism.
