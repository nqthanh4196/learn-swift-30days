// ============================================
// Day 10 - WeatherApp
// Topic: Enumerations
// ============================================

// MARK: - Weather Condition Enum
enum Weather {
    case sunny(temperature: Double)
    case cloudy(coverage: Int)
    case rainy(amount: Double, thunderstorm: Bool)
    case windy(speed: Double)
    case snowy(accumulation: Double)
    
    var emoji: String {
        switch self {
        case .sunny: return "☀️"
        case .cloudy: return "☁️"
        case .rainy(_, let thunder): return thunder ? "⛈️" : "🌧️"
        case .windy: return "💨"
        case .snowy: return "❄️"
        }
    }
    
    var description: String {
        switch self {
        case .sunny(let temp):
            return "Sunny, \(temp)°C"
        case .cloudy(let coverage):
            return "Cloudy, \(coverage)% coverage"
        case .rainy(let amount, let thunder):
            let type = thunder ? "Thunderstorm" : "Rain"
            return "\(type), \(amount)mm"
        case .windy(let speed):
            return "Windy, \(speed) km/h"
        case .snowy(let acc):
            return "Snow, \(acc)cm accumulation"
        }
    }
    
    var advisory: String {
        switch self {
        case .sunny(let temp) where temp > 35:
            return "⚠️ Nắng nóng! Hạn chế ra ngoài"
        case .sunny:
            return "👍 Thời tiết đẹp"
        case .rainy(let amount, _) where amount > 50:
            return "⚠️ Mưa lớn! Cẩn thận ngập"
        case .rainy:
            return "🌂 Nhớ mang ô"
        case .windy(let speed) where speed > 60:
            return "⚠️ Gió mạnh! Ở trong nhà"
        case .windy:
            return "🧥 Mặc áo khoác"
        case .snowy:
            return "🧣 Mặc ấm, đường trơn"
        case .cloudy:
            return "👍 Mát mẻ, dễ chịu"
        }
    }
}

// MARK: - Day of Week
enum DayOfWeek: Int, CaseIterable {
    case monday = 1, tuesday, wednesday, thursday, friday, saturday, sunday
    
    var isWeekend: Bool {
        self == .saturday || self == .sunday
    }
    
    var name: String {
        switch self {
        case .monday: return "Thứ 2"
        case .tuesday: return "Thứ 3"
        case .wednesday: return "Thứ 4"
        case .thursday: return "Thứ 5"
        case .friday: return "Thứ 6"
        case .saturday: return "Thứ 7"
        case .sunday: return "Chủ nhật"
        }
    }
}

// MARK: - Demo
print("🌤️ Weather App")
print("================================\n")

let forecast: [(day: DayOfWeek, weather: Weather)] = [
    (.monday, .sunny(temperature: 32)),
    (.tuesday, .cloudy(coverage: 60)),
    (.wednesday, .rainy(amount: 25, thunderstorm: false)),
    (.thursday, .rainy(amount: 80, thunderstorm: true)),
    (.friday, .sunny(temperature: 38)),
    (.saturday, .windy(speed: 45)),
    (.sunday, .sunny(temperature: 30)),
]

print("📅 7-Day Forecast:")
for item in forecast {
    let weekend = item.day.isWeekend ? " 🏖️" : ""
    print("  \(item.weather.emoji) \(item.day.name): \(item.weather.description)\(weekend)")
    print("     → \(item.weather.advisory)")
}

// Count weather types
print("\n📊 Summary:")
let rainyDays = forecast.filter { if case .rainy = $0.weather { return true }; return false }
let sunnyDays = forecast.filter { if case .sunny = $0.weather { return true }; return false }
print("  ☀️ Sunny days: \(sunnyDays.count)")
print("  🌧️ Rainy days: \(rainyDays.count)")
