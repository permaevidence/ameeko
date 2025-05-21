import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()

    func login(email: String, password: String) {
        // TODO: Implement authentication
    }

    func register(email: String, password: String) {
        // TODO: Implement registration
    }

    func updateLocation(_ location: Location) {
        // TODO: Send location to server
    }
}
