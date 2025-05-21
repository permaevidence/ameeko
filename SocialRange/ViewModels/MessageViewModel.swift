import Foundation
import Combine

class MessageViewModel: ObservableObject {
    @Published var conversations: [UUID: [Message]] = [:]
    private var cancellables = Set<AnyCancellable>()

    func sendMessage(to recipientID: UUID, content: String) {
        let senderID = DataStore.shared.currentUser?.id ?? UUID()
        let message = Message(id: UUID(),
                              senderID: senderID,
                              recipientID: recipientID,
                              content: content,
                              createdAt: Date())
        DataStore.shared.messages[recipientID, default: []].append(message)
        conversations[recipientID, default: []].append(message)
    }

    func loadMessages(with userID: UUID) {
        conversations[userID] = DataStore.shared.messages[userID] ?? []
    }
}
