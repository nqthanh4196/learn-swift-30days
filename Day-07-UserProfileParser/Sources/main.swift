// ============================================
// Day 07 - UserProfileParser
// Topic: Optionals & Optional Chaining
// ============================================

// MARK: - 1. Models
struct Address {
    var street: String?
    var city: String?
    var zipCode: String?
}

struct UserProfile {
    var name: String
    var email: String?
    var phone: String?
    var age: Int?
    var address: Address?
    
    var displayName: String {
        return name
    }
    
    var contactInfo: String {
        return email ?? phone ?? "No contact"
    }
}

// MARK: - 2. Parser
func parseProfile(from data: [String: Any]) -> UserProfile? {
    guard let name = data["name"] as? String else {
        print("❌ Missing required field: name")
        return nil
    }
    
    let email = data["email"] as? String
    let phone = data["phone"] as? String
    let age = data["age"] as? Int
    
    var address: Address?
    if let addressData = data["address"] as? [String: String] {
        address = Address(
            street: addressData["street"],
            city: addressData["city"],
            zipCode: addressData["zipCode"]
        )
    }
    
    return UserProfile(name: name, email: email, phone: phone, age: age, address: address)
}

// MARK: - 3. Display
func displayProfile(_ profile: UserProfile) {
    print("👤 \(profile.displayName)")
    print("   Email: \(profile.email ?? "N/A")")
    print("   Phone: \(profile.phone ?? "N/A")")
    
    if let age = profile.age {
        print("   Age: \(age)")
    }
    
    // Optional chaining
    if let city = profile.address?.city {
        print("   City: \(city)")
    }
    
    let fullAddress = [
        profile.address?.street,
        profile.address?.city,
        profile.address?.zipCode
    ].compactMap { $0 }.joined(separator: ", ")
    
    print("   Address: \(fullAddress.isEmpty ? "N/A" : fullAddress)")
    print("   Contact: \(profile.contactInfo)")
}

// MARK: - 4. Test Data
print("🔍 User Profile Parser")
print("================================\n")

let userData1: [String: Any] = [
    "name": "Nguyễn Quốc Thanh",
    "email": "thanh@example.com",
    "age": 25,
    "address": ["street": "123 Nguyễn Huệ", "city": "Hồ Chí Minh", "zipCode": "70000"]
]

let userData2: [String: Any] = [
    "name": "Trần Minh",
    "phone": "0901234567"
]

let userData3: [String: Any] = [
    "score": 100  // Missing name!
]

let datasets = [userData1, userData2, userData3]

for (index, data) in datasets.enumerated() {
    print("--- Profile \(index + 1) ---")
    if let profile = parseProfile(from: data) {
        displayProfile(profile)
    }
    print("")
}
