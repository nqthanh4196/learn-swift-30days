// Day 20 - Extra: Async sequences & Cancellation
import Foundation

// AsyncSequence example
struct Countdown: AsyncSequence {
    typealias Element = Int
    let start: Int
    
    struct AsyncIterator: AsyncIteratorProtocol {
        var current: Int
        mutating func next() async -> Int? {
            guard current > 0 else { return nil }
            try? await Task.sleep(nanoseconds: 100_000_000)
            defer { current -= 1 }
            return current
        }
    }
    
    func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(current: start)
    }
}

// Task cancellation
func cancellableWork() async {
    for i in 1...10 {
        if Task.isCancelled { print("  Cancelled at \(i)"); return }
        try? await Task.sleep(nanoseconds: 100_000_000)
        print("  Step \(i)")
    }
}
