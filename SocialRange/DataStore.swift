import Foundation

struct StoredUser {
    var user: User
    var password: String
}

class DataStore {
    static let shared = DataStore()
    private init() {}

    var usersByEmail: [String: StoredUser] = [:]
    var currentUser: User?
    var posts: [Post] = []
    var comments: [UUID: [Comment]] = [:]
    var messages: [UUID: [Message]] = [:] // keyed by recipient ID for current user
}
