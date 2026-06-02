// Day 16 - Extra Examples
func max<T: Comparable>(_ a: T, _ b: T) -> T { a > b ? a : b }
print("max(3, 7): \(max(3, 7))")
print("max(\"a\", \"z\"): \(max("a", "z"))")

// Generic Result type
enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}

enum NetworkError: Error { case timeout, notFound }
let result: Result<String, NetworkError> = .success("Data loaded")
switch result {
case .success(let data): print("\n✅ \(data)")
case .failure(let error): print("\n❌ \(error)")
}
