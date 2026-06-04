// ============================================
// Day 20 - AsyncImageLoader
// Topic: Concurrency (async/await)
// ============================================
import Foundation

// MARK: - Simulated async functions
func fetchUserProfile(id: Int) async throws -> String {
    try await Task.sleep(nanoseconds: 500_000_000) // 0.5s
    return "User_\(id)"
}

func fetchUserPosts(userId: Int) async throws -> [String] {
    try await Task.sleep(nanoseconds: 300_000_000)
    return ["Post 1", "Post 2", "Post 3"]
}

func fetchImageData(url: String) async throws -> Int {
    try await Task.sleep(nanoseconds: 200_000_000)
    return Int.random(in: 100...500) // simulated KB
}

// MARK: - Sequential vs Parallel
func sequentialFetch() async throws {
    print("⏳ Sequential fetch:")
    let start = Date()
    
    let user = try await fetchUserProfile(id: 1)
    let posts = try await fetchUserPosts(userId: 1)
    
    let elapsed = Date().timeIntervalSince(start)
    print("  User: \(user), Posts: \(posts.count)")
    print("  Time: \(String(format: "%.2f", elapsed))s\n")
}

func parallelFetch() async throws {
    print("⚡ Parallel fetch (async let):")
    let start = Date()
    
    async let user = fetchUserProfile(id: 1)
    async let posts = fetchUserPosts(userId: 1)
    
    let (u, p) = try await (user, posts)
    let elapsed = Date().timeIntervalSince(start)
    print("  User: \(u), Posts: \(p.count)")
    print("  Time: \(String(format: "%.2f", elapsed))s\n")
}

// MARK: - Task Group
func batchDownload(urls: [String]) async throws -> Int {
    try await withThrowingTaskGroup(of: Int.self) { group in
        for url in urls {
            group.addTask { try await fetchImageData(url: url) }
        }
        var totalSize = 0
        for try await size in group {
            totalSize += size
        }
        return totalSize
    }
}

// MARK: - Actor
actor ImageCache {
    private var cache: [String: Int] = [:]
    
    func get(_ key: String) -> Int? { cache[key] }
    
    func set(_ key: String, size: Int) {
        cache[key] = size
    }
    
    var count: Int { cache.count }
}

// MARK: - Main
print("🖼️ Async Image Loader")
print("================================\n")

// Run async code
let semaphore = DispatchSemaphore(value: 0)

Task {
    do {
        try await sequentialFetch()
        try await parallelFetch()
        
        // Batch download
        print("📦 Batch download (TaskGroup):")
        let urls = (1...5).map { "https://example.com/img\($0).png" }
        let totalSize = try await batchDownload(urls: urls)
        print("  Downloaded \(urls.count) images, total: \(totalSize)KB\n")
        
        // Actor
        print("🔒 Actor (thread-safe cache):")
        let cache = ImageCache()
        await cache.set("img1", size: 250)
        await cache.set("img2", size: 180)
        let size = await cache.get("img1")
        print("  Cached items: \(await cache.count)")
        print("  img1 size: \(size ?? 0)KB")
        
    } catch {
        print("❌ Error: \(error)")
    }
    semaphore.signal()
}

semaphore.wait()
print("\n✅ All async operations complete!")
