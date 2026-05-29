// ============================================
// Day 08 - ShoppingList
// Topic: Arrays & Sets
// ============================================

// MARK: - Shopping List Manager
struct ShoppingList {
    private var items: [(name: String, quantity: Int, bought: Bool)] = []
    private var categories: Set<String> = []
    
    mutating func add(_ name: String, quantity: Int = 1, category: String = "General") {
        items.append((name: name, quantity: quantity, bought: false))
        categories.insert(category)
    }
    
    mutating func remove(at index: Int) {
        guard index >= 0, index < items.count else { return }
        items.remove(at: index)
    }
    
    mutating func markBought(at index: Int) {
        guard index >= 0, index < items.count else { return }
        items[index].bought = true
    }
    
    func search(_ keyword: String) -> [(name: String, quantity: Int, bought: Bool)] {
        return items.filter { $0.name.lowercased().contains(keyword.lowercased()) }
    }
    
    var sortedByName: [(name: String, quantity: Int, bought: Bool)] {
        return items.sorted { $0.name < $1.name }
    }
    
    var pendingItems: [(name: String, quantity: Int, bought: Bool)] {
        return items.filter { !$0.bought }
    }
    
    func display() {
        print("🛒 Shopping List (\(items.count) items)")
        print("   Categories: \(categories.sorted().joined(separator: ", "))")
        print("   ─────────────────────────")
        for (index, item) in items.enumerated() {
            let status = item.bought ? "✅" : "⬜"
            print("   \(index + 1). \(status) \(item.name) x\(item.quantity)")
        }
    }
}

// MARK: - Demo
var list = ShoppingList()

// Add items
list.add("Sữa tươi", quantity: 2, category: "Dairy")
list.add("Trứng gà", quantity: 10, category: "Dairy")
list.add("Bánh mì", quantity: 1, category: "Bakery")
list.add("Cà phê", quantity: 3, category: "Beverages")
list.add("Táo", quantity: 5, category: "Fruits")
list.add("Chuối", quantity: 6, category: "Fruits")

print("📋 Initial list:")
list.display()

// Mark some as bought
list.markBought(at: 0)
list.markBought(at: 2)

print("\n📋 After shopping:")
list.display()

// Search
print("\n🔍 Search 'C':")
let results = list.search("C")
results.forEach { print("   - \($0.name) x\($0.quantity)") }

// Pending
print("\n⏳ Still need to buy:")
list.pendingItems.forEach { print("   - \($0.name)") }

// MARK: - Set Operations Demo
print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("📊 Set Operations Demo")

let mySkills: Set = ["Swift", "UIKit", "SwiftUI", "Combine", "CoreData"]
let jobRequirements: Set = ["Swift", "SwiftUI", "Combine", "GraphQL", "CI/CD"]

print("\n👤 My skills: \(mySkills.sorted())")
print("💼 Job needs: \(jobRequirements.sorted())")
print("✅ Match: \(mySkills.intersection(jobRequirements).sorted())")
print("📚 Need to learn: \(jobRequirements.subtracting(mySkills).sorted())")
print("💪 Extra skills: \(mySkills.subtracting(jobRequirements).sorted())")
