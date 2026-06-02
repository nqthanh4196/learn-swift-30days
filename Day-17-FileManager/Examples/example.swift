// Day 17 - Extra Examples
enum ValidationError: Error {
    case tooShort(min: Int)
    case tooLong(max: Int)
    case invalidCharacters
}

func validatePassword(_ password: String) throws {
    guard password.count >= 8 else { throw ValidationError.tooShort(min: 8) }
    guard password.count <= 32 else { throw ValidationError.tooLong(max: 32) }
    guard password.rangeOfCharacter(from: .alphanumerics.inverted) == nil else {
        throw ValidationError.invalidCharacters
    }
}

let passwords = ["hi", "validpass123", "has space", String(repeating: "a", count: 50)]
for pwd in passwords {
    do {
        try validatePassword(pwd)
        print("✅ '\(pwd)' is valid")
    } catch ValidationError.tooShort(let min) {
        print("❌ '\(pwd)' too short (min \(min))")
    } catch ValidationError.tooLong(let max) {
        print("❌ '\(pwd)' too long (max \(max))")
    } catch {
        print("❌ '\(pwd)' invalid: \(error)")
    }
}
