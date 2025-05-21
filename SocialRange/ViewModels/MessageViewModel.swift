import Foundation
import Combine

class MessageViewModel: ObservableObject {
    @Published var conversations: [UUID: [Message]] = [:]
    private var cancellables = Set<AnyCancellable>()

    func sendMessage(to recipientID: UUID, content: String) {
        // TODO: Send message to server
    }

    func loadMessages(with userID: UUID) {
        // TODO: Load messages from server
    }
}
