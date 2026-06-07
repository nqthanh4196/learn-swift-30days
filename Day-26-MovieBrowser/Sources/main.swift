// ============================================
// Day 26 - MovieBrowser
// Topic: JSON Parsing & Codable
// ============================================
import Foundation

// MARK: - Models with Codable
struct Movie: Codable {
    let id: Int
    let title: String
    let year: Int
    let rating: Double
    let genres: [String]
    let director: Director
    
    enum CodingKeys: String, CodingKey {
        case id, title, year, rating, genres
        case director = "directed_by"
    }
}

struct Director: Codable {
    let name: String
    let nationality: String
}

struct MovieResponse: Codable {
    let movies: [Movie]
    let total: Int
}

// MARK: - Sample JSON
let jsonString = """
{
    "movies": [
        {
            "id": 1,
            "title": "The Swift Developer",
            "year": 2024,
            "rating": 8.5,
            "genres": ["Drama", "Tech"],
            "directed_by": {"name": "Tim Cook", "nationality": "American"}
        },
        {
            "id": 2,
            "title": "Protocol Oriented",
            "year": 2023,
            "rating": 9.1,
            "genres": ["Sci-Fi", "Action"],
            "directed_by": {"name": "Chris Lattner", "nationality": "American"}
        },
        {
            "id": 3,
            "title": "Concurrency Wars",
            "year": 2025,
            "rating": 7.8,
            "genres": ["Thriller"],
            "directed_by": {"name": "Doug Gregor", "nationality": "American"}
        }
    ],
    "total": 3
}
"""

// MARK: - Parsing
print("🎬 Movie Browser")
print("================================\n")

let decoder = JSONDecoder()
let data = jsonString.data(using: .utf8)!

do {
    let response = try decoder.decode(MovieResponse.self, from: data)
    
    print("📋 Found \(response.total) movies:\n")
    for movie in response.movies {
        print("🎬 \(movie.title) (\(movie.year))")
        print("   ⭐ \(movie.rating)/10")
        print("   🎭 \(movie.genres.joined(separator: ", "))")
        print("   🎬 Dir: \(movie.director.name)")
        print("")
    }
    
    // Filter & sort
    let topRated = response.movies.filter { $0.rating >= 8.0 }.sorted { $0.rating > $1.rating }
    print("⭐ Top rated (≥8.0):")
    topRated.forEach { print("  \($0.title): \($0.rating)") }
    
    // Encode back to JSON
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let encoded = try encoder.encode(response.movies.first!)
    print("\n📤 Encoded first movie:")
    print(String(data: encoded, encoding: .utf8)!)
    
} catch {
    print("❌ Decoding error: \(error)")
}
