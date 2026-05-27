// Day 25 - Extra: POST request & generic network layer
import Foundation

struct APIClient {
    static func request<T: Decodable>(_ url: String, method: String = "GET", body: Data? = nil) async throws -> T {
        guard let url = URL(string: url) else { fatalError("Invalid URL") }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(T.self, from: data)
    }
}

// Usage:
// let posts: [Post] = try await APIClient.request("https://api.example.com/posts")
// let user: User = try await APIClient.request("https://api.example.com/users/1")
