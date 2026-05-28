// ============================================
// Day 05 - TemperatureConverter
// Topic: Functions & Parameters
// ============================================

// MARK: - 1. Basic Conversion Functions
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return celsius * 9.0 / 5.0 + 32.0
}

func fahrenheitToCelsius(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32.0) * 5.0 / 9.0
}

func celsiusToKelvin(_ celsius: Double) -> Double {
    return celsius + 273.15
}

func kelvinToCelsius(_ kelvin: Double) -> Double {
    return kelvin - 273.15
}

// MARK: - 2. Function with default parameter
func formatTemperature(_ value: Double, unit: String = "°C", decimals: Int = 1) -> String {
    return String(format: "%.\(decimals)f%@", value, unit)
}

// MARK: - 3. Convert function using enum-like approach
func convert(_ value: Double, from source: String, to target: String) -> Double? {
    // First convert to Celsius
    let celsius: Double
    switch source {
    case "C": celsius = value
    case "F": celsius = fahrenheitToCelsius(value)
    case "K": celsius = kelvinToCelsius(value)
    default: return nil
    }
    
    // Then convert to target
    switch target {
    case "C": return celsius
    case "F": return celsiusToFahrenheit(celsius)
    case "K": return celsiusToKelvin(celsius)
    default: return nil
    }
}

// MARK: - 4. Variadic function
func averageTemperature(_ temps: Double...) -> Double {
    guard !temps.isEmpty else { return 0 }
    return temps.reduce(0, +) / Double(temps.count)
}

// MARK: - 5. Demo
print("🌡️ Temperature Converter")
print("================================")

let testCelsius = 37.0
print("\n📊 \(testCelsius)°C conversions:")
print("  → Fahrenheit: \(formatTemperature(celsiusToFahrenheit(testCelsius), unit: "°F"))")
print("  → Kelvin: \(formatTemperature(celsiusToKelvin(testCelsius), unit: "K"))")

print("\n📊 Common temperatures:")
let temps = [0.0, 20.0, 37.0, 100.0]
for temp in temps {
    let f = celsiusToFahrenheit(temp)
    print("  \(formatTemperature(temp)) = \(formatTemperature(f, unit: "°F"))")
}

print("\n📊 Universal converter:")
if let result = convert(212, from: "F", to: "C") {
    print("  212°F = \(formatTemperature(result))")
}
if let result = convert(0, from: "C", to: "K") {
    print("  0°C = \(formatTemperature(result, unit: "K"))")
}

print("\n📊 Weekly average:")
let weekTemps = averageTemperature(30, 32, 28, 35, 33, 29, 31)
print("  Average: \(formatTemperature(weekTemps))")
