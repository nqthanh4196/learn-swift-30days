// ============================================
// Day 02 - StringCalculator
// Topic: Operators & String Interpolation
// ============================================

// MARK: - 1. Arithmetic Operators
let price: Double = 299_000
let quantity = 3
let discount = 0.15

let subtotal = price * Double(quantity)
let discountAmount = subtotal * discount
let total = subtotal - discountAmount

print("🛒 String Calculator - Invoice")
print("================================")
print("Price: \(price) VND x \(quantity)")
print("Subtotal: \(subtotal) VND")
print("Discount (\(Int(discount * 100))%): -\(discountAmount) VND")
print("Total: \(total) VND")
print("")

// MARK: - 2. Comparison & Ternary
let budget: Double = 1_000_000
let canAfford = total <= budget
print("💰 Budget: \(budget) VND")
print("Can afford: \(canAfford ? "✅ Yes" : "❌ No")")
print("")

// MARK: - 3. String Interpolation
let customerName = "Nguyễn Quốc Thanh"
let memberLevel = "Gold"
let points = 2450

let greeting = "Xin chào \(customerName) (\(memberLevel) member)!"
let pointsMessage = "Bạn có \(points) điểm, cần thêm \(3000 - points) để lên Platinum."

print("👤 \(greeting)")
print("⭐ \(pointsMessage)")
print("")

// MARK: - 4. Compound Assignment
var wallet: Double = 500_000
print("💳 Wallet: \(wallet) VND")

wallet -= total
print("After purchase: \(wallet) VND")

wallet += 200_000
print("After top-up: \(wallet) VND")
print("")

// MARK: - 5. BMI Calculator
let weight = 68.5  // kg
let height = 1.72  // m
let bmi = weight / (height * height)

let category: String
if bmi < 18.5 {
    category = "Underweight"
} else if bmi < 25 {
    category = "Normal"
} else if bmi < 30 {
    category = "Overweight"
} else {
    category = "Obese"
}

print("📊 BMI Calculator")
print("Weight: \(weight)kg, Height: \(height)m")
print("BMI: \(String(format: "%.1f", bmi)) - \(category)")
