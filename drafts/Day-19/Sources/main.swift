// ============================================
// Day 19 - MemoryLeakDemo
// Topic: Memory Management (ARC)
// ============================================

// MARK: - 1. Basic ARC
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("  ✅ \(name) initialized")
    }
    deinit { print("  ♻️ \(name) deallocated") }
}

print("📦 ARC Demo")
print("================================\n")

print("1️⃣ Basic ARC:")
var ref1: Person? = Person(name: "Thanh")
var ref2 = ref1  // ref count = 2
ref1 = nil       // ref count = 1
print("  ref1 = nil, object still alive (ref2 holds it)")
ref2 = nil       // ref count = 0, deinit called
print("")

// MARK: - 2. Retain Cycle Demo
class Employee {
    let name: String
    var department: Department?
    init(name: String) { self.name = name; print("  ✅ Employee \(name) init") }
    deinit { print("  ♻️ Employee \(name) deinit") }
}

class Department {
    let name: String
    weak var manager: Employee?  // weak to break cycle
    init(name: String) { self.name = name; print("  ✅ Department \(name) init") }
    deinit { print("  ♻️ Department \(name) deinit") }
}

print("2️⃣ Weak reference (no retain cycle):")
var emp: Employee? = Employee(name: "Thanh")
var dept: Department? = Department(name: "iOS")
emp?.department = dept
dept?.manager = emp  // weak reference
emp = nil   // Employee deallocated
dept = nil  // Department deallocated
print("")

// MARK: - 3. Unowned reference
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) { self.name = name; print("  ✅ Customer \(name) init") }
    deinit { print("  ♻️ Customer \(name) deinit") }
}

class CreditCard {
    let number: String
    unowned let owner: Customer  // always has owner
    init(number: String, owner: Customer) {
        self.number = number
        self.owner = owner
        print("  ✅ Card \(number) init")
    }
    deinit { print("  ♻️ Card \(number) deinit") }
}

print("3️⃣ Unowned reference:")
var customer: Customer? = Customer(name: "Minh")
customer?.card = CreditCard(number: "4532-XXXX", owner: customer!)
customer = nil  // Both deallocated
print("")

// MARK: - 4. Closure capture list
class ViewController {
    let name: String
    var onComplete: (() -> Void)?
    
    init(name: String) { self.name = name; print("  ✅ VC \(name) init") }
    deinit { print("  ♻️ VC \(name) deinit") }
    
    func setupWithLeak() {
        // ❌ Strong capture → retain cycle
        onComplete = { print("  Done: \(self.name)") }
    }
    
    func setupCorrectly() {
        // ✅ Weak capture → no retain cycle
        onComplete = { [weak self] in
            guard let self = self else { return }
            print("  Done: \(self.name)")
        }
    }
}

print("4️⃣ Closure capture list:")
var vc: ViewController? = ViewController(name: "Home")
vc?.setupCorrectly()
vc?.onComplete?()
vc = nil  // Properly deallocated
print("")

print("✅ All memory properly managed!")
