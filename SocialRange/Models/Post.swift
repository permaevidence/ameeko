import Foundation

struct Post: Identifiable, Codable {
    let id: UUID
    let authorID: UUID
    var content: String
    var createdAt: Date
    var location: Location
    var rangeInKilometers: Double
}

struct Comment: Identifiable, Codable {
    let id: UUID
    let postID: UUID
    let authorID: UUID
    var content: String
    var createdAt: Date
}
