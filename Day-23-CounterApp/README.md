# Day 23 - State Management (@State, @Binding)

## 📖 Giới thiệu
SwiftUI dùng property wrappers để quản lý state. @State cho local state, @Binding cho shared state giữa views, @ObservedObject cho complex objects.

## 🎯 Kiến thức chính
- `@State` - local mutable state
- `@Binding` - two-way connection to parent's state
- `@ObservedObject` / `@StateObject` - external observable objects
- `@EnvironmentObject` - shared across view hierarchy

## 📝 Tóm tắt
- @State cho simple value types (Int, String, Bool)
- @Binding truyền state xuống child views
- @StateObject tạo và own object, @ObservedObject chỉ observe
- State changes trigger view re-render automatically
