// ============================================
// Day 18 - LibraryModule
// Topic: Access Control & Modules
// ============================================

// MARK: - Public API (would be 'public' in a real module)
struct Library {
    // Private storage
    private var books: [Book] = []
    private var members: [Member] = []
    private var nextId = 1
    
    // Read-only from outside
    private(set) var totalLoans = 0
    
    struct Book {
        let id: Int
        let title: String
        let author: String
        fileprivate(set) var isAvailable: Bool = true
    }
    
    struct Member {
        let id: Int
        let name: String
        private(set) var borrowedBooks: [Int] = []
        
        fileprivate mutating func borrow(_ bookId: Int) {
            borrowedBooks.append(bookId)
        }
        
        fileprivate mutating func returnBook(_ bookId: Int) {
            borrowedBooks.removeAll { $0 == bookId }
        }
    }
    
    // MARK: - Public Interface
    mutating func addBook(title: String, author: String) -> Int {
        let book = Book(id: nextId, title: title, author: author)
        books.append(book)
        nextId += 1
        return book.id
    }
    
    mutating func registerMember(name: String) -> Int {
        let member = Member(id: nextId, name: name)
        members.append(member)
        nextId += 1
        return member.id
    }
    
    mutating func borrowBook(bookId: Int, memberId: Int) -> Bool {
        guard let bookIdx = books.firstIndex(where: { $0.id == bookId }),
              let memberIdx = members.firstIndex(where: { $0.id == memberId }),
              books[bookIdx].isAvailable else { return false }
        
        books[bookIdx].isAvailable = false
        members[memberIdx].borrow(bookId)
        totalLoans += 1
        return true
    }
    
    mutating func returnBook(bookId: Int, memberId: Int) -> Bool {
        guard let bookIdx = books.firstIndex(where: { $0.id == bookId }),
              let memberIdx = members.firstIndex(where: { $0.id == memberId }) else { return false }
        
        books[bookIdx].isAvailable = true
        members[memberIdx].returnBook(bookId)
        return true
    }
    
    // Public read access
    var availableBooks: [Book] { books.filter { $0.isAvailable } }
    var allBooks: [Book] { books }
    
    func getMember(_ id: Int) -> Member? {
        members.first { $0.id == id }
    }
}

// MARK: - Demo
print("📚 Library Module")
print("================================\n")

var lib = Library()

let b1 = lib.addBook(title: "Swift Programming", author: "Apple")
let b2 = lib.addBook(title: "Clean Code", author: "Robert Martin")
let b3 = lib.addBook(title: "Design Patterns", author: "GoF")

let m1 = lib.registerMember(name: "Thanh")
let m2 = lib.registerMember(name: "Minh")

print("📖 All books: \(lib.allBooks.map { $0.title })")
print("👥 Member Thanh ID: \(m1)")

lib.borrowBook(bookId: b1, memberId: m1)
lib.borrowBook(bookId: b2, memberId: m1)
lib.borrowBook(bookId: b3, memberId: m2)

print("\n📊 After borrowing:")
print("Available: \(lib.availableBooks.map { $0.title })")
print("Total loans: \(lib.totalLoans)")

if let thanh = lib.getMember(m1) {
    print("Thanh's books: \(thanh.borrowedBooks)")
}

lib.returnBook(bookId: b1, memberId: m1)
print("\nAfter return:")
print("Available: \(lib.availableBooks.map { $0.title })")
