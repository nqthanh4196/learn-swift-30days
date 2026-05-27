# Day 18 - Access Control & Modules

## 📖 Giới thiệu

Access control giới hạn quyền truy cập vào code. Modules tổ chức code thành packages. Đây là nền tảng để viết code an toàn và maintainable.

---

## 🎯 Kiến thức chính

### Access Levels (từ mở nhất → đóng nhất)

| Level | Scope |
|-------|-------|
| `open` | Anywhere + subclass/override |
| `public` | Anywhere |
| `internal` | Same module (default) |
| `fileprivate` | Same file |
| `private` | Same declaration |

### Best Practice

```swift
public struct APIClient {
    private let apiKey: String
    private(set) var requestCount: Int = 0
    
    public init(apiKey: String) { self.apiKey = apiKey }
    
    public func fetch() { /* ... */ }
    private func buildHeaders() -> [String: String] { [:] }
}
```

---

## 📝 Tóm tắt

- Default là `internal` (visible trong cùng module)
- `private` cho implementation details
- `private(set)` cho read-only từ bên ngoài
- `public` cho API bạn muốn expose
- Principle of least privilege: dùng access level nhỏ nhất có thể
