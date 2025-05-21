import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()

    func login(email: String, password: String) {
        if let stored = DataStore.shared.usersByEmail[email],
           stored.password == password {
            currentUser = stored.user
            DataStore.shared.currentUser = stored.user
        }
    }

    func register(email: String, password: String) {
        let newUser = User(id: UUID(),
                           email: email,
                           profile: Profile(name: "New User",
                                            bio: "",
                                            avatarURL: nil),
                           location: nil)
        let stored = StoredUser(user: newUser, password: password)
        DataStore.shared.usersByEmail[email] = stored
        currentUser = newUser
        DataStore.shared.currentUser = newUser
    }

    func updateLocation(_ location: Location) {
        guard var user = currentUser else { return }
        user.location = location
        currentUser = user
        DataStore.shared.currentUser = user
        if let email = DataStore.shared.usersByEmail.first(where: { $0.value.user.id == user.id })?.key {
            DataStore.shared.usersByEmail[email]?.user = user
        }
    }
}
