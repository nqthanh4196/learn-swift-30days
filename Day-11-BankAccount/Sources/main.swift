// ============================================
// Day 11 - BankAccount
// Topic: Structs vs Classes
// ============================================

// MARK: - Struct: Transaction (Value Type)
struct Transaction {
    let id: Int
    let amount: Double
    let type: TransactionType
    let description: String
    let date: String
    
    enum TransactionType: String {
        case deposit = "➕"
        case withdrawal = "➖"
        case transfer = "↔️"
    }
}

// MARK: - Class: BankAccount (Reference Type)
class BankAccount {
    let accountNumber: String
    let owner: String
    private(set) var balance: Double
    private(set) var transactions: [Transaction] = []
    private var nextTransactionId = 1
    
    init(accountNumber: String, owner: String, initialBalance: Double = 0) {
        self.accountNumber = accountNumber
        self.owner = owner
        self.balance = initialBalance
    }
    
    func deposit(_ amount: Double, description: String = "Deposit") {
        guard amount > 0 else { print("❌ Invalid amount"); return }
        balance += amount
        addTransaction(amount: amount, type: .deposit, description: description)
    }
    
    func withdraw(_ amount: Double, description: String = "Withdrawal") -> Bool {
        guard amount > 0, amount <= balance else {
            print("❌ Insufficient funds or invalid amount")
            return false
        }
        balance -= amount
        addTransaction(amount: amount, type: .withdrawal, description: description)
        return true
    }
    
    func transfer(to account: BankAccount, amount: Double) -> Bool {
        guard withdraw(amount, description: "Transfer to \(account.owner)") else { return false }
        account.deposit(amount, description: "Transfer from \(owner)")
        return true
    }
    
    private func addTransaction(amount: Double, type: Transaction.TransactionType, description: String) {
        let transaction = Transaction(
            id: nextTransactionId,
            amount: amount,
            type: type,
            description: description,
            date: "2026-05-27"
        )
        transactions.append(transaction)
        nextTransactionId += 1
    }
    
    func printStatement() {
        print("🏦 Account: \(accountNumber) (\(owner))")
        print("   Balance: \(String(format: "%.0f", balance)) VND")
        print("   Transactions:")
        for t in transactions.suffix(5) {
            print("   \(t.type.rawValue) #\(t.id) \(t.description): \(String(format: "%.0f", t.amount)) VND")
        }
    }
}

// MARK: - Demo: Value vs Reference
print("📊 Value Type vs Reference Type")
print("================================\n")

// Struct (Value Type) - Copy
var t1 = Transaction(id: 1, amount: 100, type: .deposit, description: "Test", date: "today")
var t2 = t1  // Copy
print("Struct copy: t1 and t2 are independent copies")
print("")

// Class (Reference Type) - Shared
let account1 = BankAccount(accountNumber: "001", owner: "Thanh", initialBalance: 10_000_000)
let account2 = BankAccount(accountNumber: "002", owner: "Minh", initialBalance: 5_000_000)

// Same reference demo
let sharedRef = account1
sharedRef.deposit(500_000, description: "Bonus")
print("Class reference: sharedRef.deposit affects account1")
print("account1 balance: \(account1.balance)")
print("")

// Operations
account1.deposit(2_000_000, description: "Salary")
account1.withdraw(500_000, description: "Coffee")
account1.transfer(to: account2, amount: 1_000_000)

print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
account1.printStatement()
print("")
account2.printStatement()
