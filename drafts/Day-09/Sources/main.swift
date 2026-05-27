// ============================================
// Day 09 - ContactBook
// Topic: Dictionaries & Tuples
// ============================================

// MARK: - Contact Book
struct ContactBook {
    private var contacts: [String: (phone: String, email: String?)] = [:]
    
    mutating func add(name: String, phone: String, email: String? = nil) {
        contacts[name] = (phone: phone, email: email)
    }
    
    mutating func remove(name: String) {
        contacts[name] = nil
    }
    
    func find(name: String) -> (phone: String, email: String?)? {
        return contacts[name]
    }
    
    func search(keyword: String) -> [(name: String, phone: String)] {
        return contacts
            .filter { $0.key.lowercased().contains(keyword.lowercased()) }
            .map { (name: $0.key, phone: $0.value.phone) }
    }
    
    func groupedByLetter() -> [Character: [String]] {
        var groups: [Character: [String]] = [:]
        for name in contacts.keys.sorted() {
            let letter = name.first ?? "?"
            groups[letter, default: []].append(name)
        }
        return groups
    }
    
    var count: Int { contacts.count }
    
    func display() {
        print("📱 Contact Book (\(count) contacts)")
        print("─────────────────────────")
        for (name, info) in contacts.sorted(by: { $0.key < $1.key }) {
            let emailStr = info.email ?? "N/A"
            print("  \(name): \(info.phone) | \(emailStr)")
        }
    }
}

// MARK: - Demo
var book = ContactBook()

book.add(name: "Thanh", phone: "0901234567", email: "thanh@mail.com")
book.add(name: "Minh", phone: "0912345678")
book.add(name: "Lan", phone: "0923456789", email: "lan@mail.com")
book.add(name: "Tú", phone: "0934567890")
book.add(name: "Mai", phone: "0945678901", email: "mai@mail.com")
book.add(name: "Trung", phone: "0956789012")

book.display()

// Search
print("\n🔍 Search 'T':")
let results = book.search(keyword: "T")
results.forEach { print("  \($0.name): \($0.phone)") }

// Find
print("\n🔍 Find 'Thanh':")
if let contact = book.find(name: "Thanh") {
    print("  Phone: \(contact.phone)")
    print("  Email: \(contact.email ?? "N/A")")
}

// Group by letter
print("\n📂 Grouped:")
let groups = book.groupedByLetter()
for (letter, names) in groups.sorted(by: { $0.key < $1.key }) {
    print("  [\(letter)] \(names.joined(separator: ", "))")
}

// MARK: - Tuple examples
print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("📊 Tuple Examples")

func statistics(of numbers: [Double]) -> (mean: Double, min: Double, max: Double, count: Int) {
    let mean = numbers.reduce(0, +) / Double(numbers.count)
    return (mean: mean, min: numbers.min()!, max: numbers.max()!, count: numbers.count)
}

let scores = [7.5, 8.0, 9.2, 6.8, 8.5]
let stats = statistics(of: scores)
print("\nScores: \(scores)")
print("Mean: \(String(format: "%.1f", stats.mean))")
print("Min: \(stats.min), Max: \(stats.max)")
print("Count: \(stats.count)")
