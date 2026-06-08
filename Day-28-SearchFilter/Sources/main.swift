// ============================================
// Day 28 - SearchFilter
// Topic: Combine Framework
// ============================================
import Combine
import Foundation

// MARK: - Search ViewModel with Combine
class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var results: [String] = []
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    
    private let allItems = [
        "Swift", "SwiftUI", "UIKit", "Combine", "CoreData",
        "Xcode", "Instruments", "TestFlight", "App Store",
        "Protocol", "Generics", "Closures", "Async/Await"
    ]
    
    init() {
        setupSearch()
    }
    
    private func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { [weak self] text -> [String] in
                guard let self = self, !text.isEmpty else { return self?.allItems ?? [] }
                return self.allItems.filter { $0.localizedCaseInsensitiveContains(text) }
            }
            .assign(to: &$results)
    }
}

// MARK: - Publisher examples
print("🔍 Combine - Search Filter")
print("================================\n")

// 1. Basic publisher
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var cancellables = Set<AnyCancellable>()

print("1️⃣ Filter even, multiply by 10:")
numbers.publisher
    .filter { $0 % 2 == 0 }
    .map { $0 * 10 }
    .collect()
    .sink { print("   \($0)") }
    .store(in: &cancellables)

// 2. Merge publishers
print("\n2️⃣ Merge two publishers:")
let pub1 = [1, 2, 3].publisher
let pub2 = [4, 5, 6].publisher
pub1.merge(with: pub2)
    .collect()
    .sink { print("   Merged: \($0)") }
    .store(in: &cancellables)

// 3. CombineLatest
print("\n3️⃣ CombineLatest:")
let name = CurrentValueSubject<String, Never>("Thanh")
let age = CurrentValueSubject<Int, Never>(25)

name.combineLatest(age)
    .map { "\($0) is \($1) years old" }
    .sink { print("   \($0)") }
    .store(in: &cancellables)

name.send("Minh")
age.send(30)

// 4. Error handling
print("\n4️⃣ Error handling:")
enum APIError: Error { case failed }

let result = Just("Success")
    .setFailureType(to: APIError.self)
    .catch { _ in Just("Fallback") }
    .sink { print("   Result: \($0)") }

// 5. Timer publisher
print("\n5️⃣ Timer publisher (concept):")
print("   Timer.publish(every: 1, on: .main, in: .common).autoconnect()")
print("   → Emits Date every second")

print("\n✅ Combine basics demonstrated!")
