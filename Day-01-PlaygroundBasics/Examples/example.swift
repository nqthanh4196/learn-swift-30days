// ============================================
// Day 01 - Extra Examples
// ============================================

// MARK: - Example 1: Numeric Literals
let decimal = 17
let binary = 0b10001       // 17 in binary
let octal = 0o21           // 17 in octal
let hex = 0x11             // 17 in hexadecimal

print("🔢 Number 17 in different formats:")
print("   Decimal: \(decimal)")
print("   Binary: \(binary)")
print("   Octal: \(octal)")
print("   Hex: \(hex)")
print("")

// MARK: - Example 2: Large Numbers with Underscores
let oneMillion = 1_000_000
let creditCardNumber = 1234_5678_9012_3456
let pi = 3.141_592_653

print("💰 One million: \(oneMillion)")
print("💳 Card: \(creditCardNumber)")
print("🥧 Pi: \(pi)")
print("")

// MARK: - Example 3: Type Aliases
typealias AudioSample = UInt16
typealias Velocity = Double

let maxVolume: AudioSample = 65535
let speed: Velocity = 120.5

print("🔊 Max volume (UInt16): \(maxVolume)")
print("🚗 Speed: \(speed) km/h")
print("")

// MARK: - Example 4: Tuples (Preview)
let httpStatus = (statusCode: 200, description: "OK")
print("🌐 HTTP \(httpStatus.statusCode): \(httpStatus.description)")
