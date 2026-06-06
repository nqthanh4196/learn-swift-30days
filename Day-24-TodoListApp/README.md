# Day 24 - Lists & Navigation

## 📖 Giới thiệu
List và NavigationStack là hai components quan trọng nhất để xây dựng iOS apps. List hiển thị data, Navigation cho phép drill-down.

## 🎯 Kiến thức chính
- `List` - scrollable list of data
- `NavigationStack` + `NavigationLink`
- `ForEach` với Identifiable data
- Swipe actions, pull-to-refresh
- Search với `.searchable()`

## 📝 Tóm tắt
- List tự động handle scrolling, cell reuse
- NavigationStack thay thế NavigationView (iOS 16+)
- Data phải conform Identifiable cho ForEach
- .onDelete, .onMove cho edit mode
