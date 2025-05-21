import Foundation
import Combine
import CoreLocation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private var cancellables = Set<AnyCancellable>()

    func loadFeed(for location: CLLocation) {
        // Filter posts within range of the supplied location
        let allPosts = DataStore.shared.posts
        posts = allPosts.filter { post in
            let postLocation = CLLocation(latitude: post.location.latitude,
                                         longitude: post.location.longitude)
            let distance = postLocation.distance(from: location) / 1000
            return distance <= post.rangeInKilometers
        }.sorted(by: { $0.createdAt > $1.createdAt })
    }

    func createPost(content: String, location: CLLocation, range: Double) {
        // Create a new post locally
        let userID = DataStore.shared.currentUser?.id ?? UUID()
        let post = Post(id: UUID(),
                        authorID: userID,
                        content: content,
                        createdAt: Date(),
                        location: Location(latitude: location.coordinate.latitude,
                                          longitude: location.coordinate.longitude),
                        rangeInKilometers: range)
        DataStore.shared.posts.append(post)
        loadFeed(for: location)
    }

    func addComment(post: Post, content: String) {
        let userID = DataStore.shared.currentUser?.id ?? UUID()
        let comment = Comment(id: UUID(),
                              postID: post.id,
                              authorID: userID,
                              content: content,
                              createdAt: Date())
        DataStore.shared.comments[post.id, default: []].append(comment)
    }
}
