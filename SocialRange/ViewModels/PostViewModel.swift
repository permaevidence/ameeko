import Foundation
import Combine
import CoreLocation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private var cancellables = Set<AnyCancellable>()

    func loadFeed(for location: CLLocation) {
        // TODO: Load posts from server based on location
    }

    func createPost(content: String, location: CLLocation, range: Double) {
        // TODO: Create post on server
    }

    func addComment(post: Post, content: String) {
        // TODO: Create comment on server
    }
}
