# Day 17 - Error Handling (do-try-catch)

## 📖 Giới thiệu

Error handling trong Swift dùng `do-try-catch` pattern, giúp xử lý lỗi một cách rõ ràng và an toàn. Khác với exceptions trong các ngôn ngữ khác, Swift errors là typed và predictable.

---

## 🎯 Kiến thức chính

### 1. Defining Errors

```swift
enum FileError: Error {
    case notFound(filename: String)
    case permissionDenied
    case corrupted
}
```

### 2. Throwing Functions

```swift
func readFile(_ name: String) throws -> String {
    guard name.hasSuffix(".txt") else {
        throw FileError.notFound(filename: name)
    }
    return "File content"
}
```

### 3. Do-Try-Catch

```swift
do {
    let content = try readFile("data.txt")
    print(content)
} catch FileError.notFound(let name) {
    print("File \(name) not found")
} catch {
    print("Error: \(error)")
}
```

### 4. try? and try!

```swift
let content = try? readFile("data.txt")  // Returns optional
let forced = try! readFile("safe.txt")   // Crashes on error
```

### 5. Rethrows

```swift
func perform(_ action: () throws -> Void) rethrows {
    try action()
}
```

---

## 📝 Tóm tắt

- Define errors with `enum: Error`
- `throws` marks functions that can fail
- `do-try-catch` for handling errors
- `try?` converts to optional, `try!` force unwraps
- Always handle errors specifically when possible
