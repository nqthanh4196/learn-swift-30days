# Day 22 - SwiftUI Basics (Text, Image, Button)

## 📖 Giới thiệu

SwiftUI là framework declarative UI của Apple. Thay vì imperative (UIKit), bạn mô tả UI muốn hiển thị và SwiftUI tự render. Hôm nay học 3 views cơ bản nhất.

---

## 🎯 Kiến thức chính

### 1. Text

```swift
Text("Hello, SwiftUI!")
    .font(.title)
    .foregroundColor(.blue)
    .bold()
```

### 2. Image

```swift
Image(systemName: "star.fill")
    .resizable()
    .frame(width: 50, height: 50)
    .foregroundColor(.yellow)
```

### 3. Button

```swift
Button("Tap me") {
    print("Tapped!")
}
.buttonStyle(.borderedProminent)
```

### 4. Stacks (Layout)

```swift
VStack { }  // Vertical
HStack { }  // Horizontal
ZStack { }  // Overlay
```

---

## 📝 Tóm tắt

- SwiftUI dùng declarative syntax
- Views are structs conforming to `View` protocol
- Modifiers chain để customize appearance
- VStack/HStack/ZStack cho layout
- `body` property returns the view hierarchy
