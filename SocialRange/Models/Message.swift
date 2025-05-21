import Foundation

struct Message: Identifiable, Codable {
    let id: UUID
    let senderID: UUID
    let recipientID: UUID
    var content: String
    var createdAt: Date
}
