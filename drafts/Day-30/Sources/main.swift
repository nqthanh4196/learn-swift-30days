// ============================================
// Day 30 - WeatherDashboard (Final Project)
// Combines: SwiftUI, Networking, Codable, MVVM,
//           Async/Await, Animations, State Management
// ============================================
import SwiftUI
import Combine

// MARK: - Models (Day 10, 26)
struct WeatherData: Codable, Identifiable {
    let id = UUID()
    let city: String
    let temperature: Double
    let condition: String
    let humidity: Int
    let windSpeed: Double
    
    enum CodingKeys: String, CodingKey {
        case city, temperature, condition, humidity
        case windSpeed = "wind_speed"
    }
    
    var emoji: String {
        switch condition.lowercased() {
        case "sunny": return "☀️"
        case "cloudy": return "☁️"
        case "rainy": return "🌧️"
        case "stormy": return "⛈️"
        default: return "🌤️"
        }
    }
}

// MARK: - Service (Day 20, 25)
actor WeatherService {
    func fetchWeather(for city: String) async throws -> WeatherData {
        // Simulated API call
        try await Task.sleep(nanoseconds: 500_000_000)
        return WeatherData(
            city: city,
            temperature: Double.random(in: 20...38),
            condition: ["Sunny", "Cloudy", "Rainy"].randomElement()!,
            humidity: Int.random(in: 40...90),
            windSpeed: Double.random(in: 5...30)
        )
    }
}

// MARK: - ViewModel (Day 23, 28)
@MainActor
class WeatherViewModel: ObservableObject {
    @Published var cities: [WeatherData] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service = WeatherService()
    private let defaultCities = ["Hồ Chí Minh", "Hà Nội", "Đà Nẵng", "Huế", "Cần Thơ"]
    
    func loadWeather() async {
        isLoading = true
        errorMessage = nil
        
        do {
            var results: [WeatherData] = []
            for city in defaultCities {
                let data = try await service.fetchWeather(for: city)
                results.append(data)
            }
            cities = results
        } catch {
            errorMessage = "Failed to load weather: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}

// MARK: - Views (Day 22, 24, 29)
struct WeatherDashboard: View {
    @StateObject private var vm = WeatherViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading {
                    ProgressView("Loading weather...")
                } else if let error = vm.errorMessage {
                    Text(error).foregroundColor(.red)
                } else {
                    List(vm.cities) { weather in
                        WeatherRow(weather: weather)
                    }
                }
            }
            .navigationTitle("🌤️ Weather Dashboard")
            .toolbar {
                Button("Refresh") { Task { await vm.loadWeather() } }
            }
        }
        .task { await vm.loadWeather() }
    }
}

struct WeatherRow: View {
    let weather: WeatherData
    @State private var appeared = false
    
    var body: some View {
        HStack {
            Text(weather.emoji)
                .font(.system(size: 40))
                .scaleEffect(appeared ? 1.0 : 0.5)
                .animation(.spring(response: 0.5), value: appeared)
            
            VStack(alignment: .leading) {
                Text(weather.city).font(.headline)
                Text(weather.condition).font(.caption).foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(Int(weather.temperature))°C")
                    .font(.title2).bold()
                    .foregroundColor(weather.temperature > 30 ? .red : .blue)
                HStack(spacing: 8) {
                    Label("\(weather.humidity)%", systemImage: "humidity")
                    Label("\(Int(weather.windSpeed))km/h", systemImage: "wind")
                }
                .font(.caption2)
                .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
        .onAppear { appeared = true }
    }
}

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup { WeatherDashboard() }
    }
}
