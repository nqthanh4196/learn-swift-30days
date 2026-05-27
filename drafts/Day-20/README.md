# Day 20 - Concurrency (async/await)

## 📖 Giới thiệu

Swift Concurrency (từ Swift 5.5) mang đến async/await, structured concurrency và actors. Đây là cách hiện đại để viết code bất đồng bộ, thay thế completion handlers.

---

## 🎯 Kiến thức chính

### 1. Async/Await

```swift
func fetchUser() async throws -> User {
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode(User.self, from: data)
}
```

### 2. Task

```swift
Task {
    let user = try await fetchUser()
    print(user.name)
}
```

### 3. Async Let (Parallel)

```swift
async let profile = fetchProfile()
async let posts = fetchPosts()
let (p, ps) = await (try profile, try posts)
```

### 4. TaskGroup

```swift
await withTaskGroup(of: Image.self) { group in
    for url in urls {
        group.addTask { await downloadImage(url) }
    }
}
```

### 5. Actor (Thread-safe)

```swift
actor BankAccount {
    private var balance: Double = 0
    func deposit(_ amount: Double) { balance += amount }
}
```

---

## 📝 Tóm tắt

- `async/await` thay thế completion handlers
- `Task` tạo async context từ sync code
- `async let` cho parallel execution
- `TaskGroup` cho dynamic parallel tasks
- `actor` đảm bảo thread safety
