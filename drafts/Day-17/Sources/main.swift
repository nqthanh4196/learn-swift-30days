// ============================================
// Day 17 - FileManager
// Topic: Error Handling (do-try-catch)
// ============================================

// MARK: - Error Types
enum FileError: Error, CustomStringConvertible {
    case notFound(filename: String)
    case permissionDenied(filename: String)
    case diskFull
    case invalidFormat
    
    var description: String {
        switch self {
        case .notFound(let f): return "File '\(f)' not found"
        case .permissionDenied(let f): return "Permission denied: '\(f)'"
        case .diskFull: return "Disk is full"
        case .invalidFormat: return "Invalid file format"
        }
    }
}

// MARK: - File System Simulation
struct SimpleFileManager {
    private var files: [String: String] = [
        "readme.txt": "Hello World",
        "config.json": "{\"version\": 1}",
        "secret.key": "PRIVATE_DATA",
    ]
    private let readOnlyFiles: Set<String> = ["secret.key"]
    private var usedSpace = 80 // percent
    
    func read(_ filename: String) throws -> String {
        guard let content = files[filename] else {
            throw FileError.notFound(filename: filename)
        }
        guard !readOnlyFiles.contains(filename) else {
            throw FileError.permissionDenied(filename: filename)
        }
        return content
    }
    
    mutating func write(_ filename: String, content: String) throws {
        guard usedSpace < 95 else { throw FileError.diskFull }
        guard !readOnlyFiles.contains(filename) else {
            throw FileError.permissionDenied(filename: filename)
        }
        files[filename] = content
        usedSpace += 1
    }
    
    mutating func delete(_ filename: String) throws {
        guard files[filename] != nil else {
            throw FileError.notFound(filename: filename)
        }
        guard !readOnlyFiles.contains(filename) else {
            throw FileError.permissionDenied(filename: filename)
        }
        files[filename] = nil
    }
    
    var fileList: [String] { Array(files.keys).sorted() }
}

// MARK: - Demo
print("📁 Simple File Manager")
print("================================\n")

var fm = SimpleFileManager()
print("Files: \(fm.fileList)\n")

// Successful read
do {
    let content = try fm.read("readme.txt")
    print("✅ Read readme.txt: \(content)")
} catch {
    print("❌ \(error)")
}

// File not found
do {
    let _ = try fm.read("missing.txt")
} catch let error as FileError {
    print("❌ \(error)")
} catch {
    print("❌ Unknown: \(error)")
}

// Permission denied
do {
    let _ = try fm.read("secret.key")
} catch {
    print("❌ \(error)")
}

// Write
do {
    try fm.write("notes.txt", content: "My notes")
    print("✅ Written notes.txt")
} catch {
    print("❌ \(error)")
}

// try? (optional)
print("\n📖 Using try?:")
let content1 = try? fm.read("readme.txt")
let content2 = try? fm.read("nope.txt")
print("  readme.txt: \(content1 ?? "nil")")
print("  nope.txt: \(content2 ?? "nil")")

print("\n📂 Final files: \(fm.fileList)")
