// ============================================
// Day 03 - GradeChecker
// Topic: Control Flow (if/else, switch)
// ============================================

// MARK: - Grade Checker System
func checkGrade(_ score: Int) -> String {
    guard score >= 0, score <= 100 else {
        return "❌ Invalid score (must be 0-100)"
    }
    
    switch score {
    case 90...100:
        return "🌟 A - Xuất sắc"
    case 80..<90:
        return "😊 B - Giỏi"
    case 70..<80:
        return "👍 C - Khá"
    case 60..<70:
        return "😐 D - Trung bình"
    case 50..<60:
        return "😟 E - Yếu"
    default:
        return "😢 F - Không đạt"
    }
}

// MARK: - Test with multiple students
let students: [(name: String, score: Int)] = [
    ("Thanh", 92),
    ("Minh", 85),
    ("Lan", 73),
    ("Hùng", 61),
    ("Mai", 45),
    ("Đức", 105)
]

print("📋 Grade Checker - Bảng điểm")
print("================================")
for student in students {
    let result = checkGrade(student.score)
    print("\(student.name) (\(student.score)): \(result)")
}
print("")

// MARK: - Weather Advisory
let temperature = 33
let isRaining = true

print("🌤️ Weather Advisory")
print("Temperature: \(temperature)°C, Rain: \(isRaining)")

if temperature > 35 {
    print("⚠️ Nắng nóng, hạn chế ra ngoài!")
} else if temperature > 25 {
    if isRaining {
        print("🌧️ Nóng và mưa, mang ô!")
    } else {
        print("☀️ Thời tiết đẹp!")
    }
} else if temperature > 15 {
    print("🍃 Mát mẻ, dễ chịu")
} else {
    print("🧥 Lạnh, mặc ấm nhé!")
}
print("")

// MARK: - Ternary Operator
let age = 20
let canVote = age >= 18 ? "Được bầu cử" : "Chưa đủ tuổi"
print("🗳️ Age \(age): \(canVote)")

// MARK: - Switch with Tuple
let point = (2, 0)
print("\n📍 Point \(point):")
switch point {
case (0, 0):
    print("  At origin")
case (_, 0):
    print("  On x-axis")
case (0, _):
    print("  On y-axis")
case (-2...2, -2...2):
    print("  Near origin")
default:
    print("  Somewhere else")
}
