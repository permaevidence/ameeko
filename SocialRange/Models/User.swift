import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var email: String
    var profile: Profile
    var location: Location?
}

struct Profile: Codable {
    var name: String
    var bio: String
    var avatarURL: URL?
}

struct Location: Codable {
    var latitude: Double
    var longitude: Double
}
