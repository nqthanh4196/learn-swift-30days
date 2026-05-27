// ============================================
// Day 25 - NewsReader
// Topic: Networking with URLSession
// ============================================
import Foundation

// MARK: - Models
struct Article: Codable {
    let title: String
    let description: String?
    let url: String
    let publishedAt: String?
}

struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Network Service
enum NetworkError: Error {
    case invalidURL
    case requestFailed(Int)
    case decodingFailed
    case noData
}

struct NewsService {
    let baseURL = "https://jsonplaceholder.typicode.com"
    
    func fetchPosts() async throws -> [Article] {
        guard let url = URL(string: "\(baseURL)/posts") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.noData
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.requestFailed(httpResponse.statusCode)
        }
        
        // Simulate article structure from posts
        struct Post: Codable { let id: Int; let title: String; let body: String }
        let posts = try JSONDecoder().decode([Post].self, from: data)
        
        return posts.prefix(10).map {
            Article(title: $0.title, description: $0.body, url: "\(baseURL)/posts/\($0.id)", publishedAt: "2026-05-27")
        }
    }
    
    func fetchWithCustomRequest() async throws -> Data {
        var request = URLRequest(url: URL(string: "\(baseURL)/posts")!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.timeoutInterval = 30
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}

// MARK: - Demo
print("📰 News Reader")
print("================================\n")

let semaphore = DispatchSemaphore(value: 0)
Task {
    let service = NewsService()
    do {
        let articles = try await service.fetchPosts()
        print("📋 Fetched \(articles.count) articles:\n")
        for (i, article) in articles.prefix(5).enumerated() {
            print("\(i+1). \(article.title.prefix(50))...")
            print("   \(article.description?.prefix(60) ?? "")...\n")
        }
    } catch NetworkError.requestFailed(let code) {
        print("❌ HTTP Error: \(code)")
    } catch {
        print("❌ Error: \(error)")
    }
    semaphore.signal()
}
semaphore.wait()
