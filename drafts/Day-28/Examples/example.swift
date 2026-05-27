// Day 28 - Extra: Combine + URLSession
import Combine
import Foundation

struct Post: Codable { let id: Int; let title: String }

func fetchPosts() -> AnyPublisher<[Post], Error> {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    return URLSession.shared.dataTaskPublisher(for: url)
        .map(\.data)
        .decode(type: [Post].self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
}

// Usage in SwiftUI ViewModel:
// fetchPosts()
//     .sink(receiveCompletion: { _ in }, receiveValue: { posts in self.posts = posts })
//     .store(in: &cancellables)
