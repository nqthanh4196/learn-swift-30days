// Day 26 - Extra: Custom decoding & date strategies
import Foundation

struct Event: Codable {
    let name: String
    let date: Date
    let attendees: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        date = try container.decode(Date.self, forKey: .date)
        attendees = try container.decodeIfPresent(Int.self, forKey: .attendees)
    }
}

let json = #"{"name":"WWDC","date":"2026-06-09T10:00:00Z","attendees":null}"#
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601

if let event = try? decoder.decode(Event.self, from: json.data(using: .utf8)!) {
    print("Event: \(event.name), Date: \(event.date)")
    print("Attendees: \(event.attendees ?? 0)")
}
