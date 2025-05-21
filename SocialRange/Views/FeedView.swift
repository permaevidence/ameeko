import SwiftUI
import CoreLocation

struct FeedView: View {
    @StateObject var postVM = PostViewModel()
    @State private var locationManager = CLLocationManager()
    @State private var currentLocation: CLLocation?

    var body: some View {
        List(postVM.posts) { post in
            NavigationLink(destination: PostDetailView(post: post)) {
                PostRow(post: post)
            }
        }
        .navigationTitle("Feed")
        .toolbar {
            NavigationLink(destination: CreatePostView()) {
                Image(systemName: "plus")
            }
        }
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
            currentLocation = locationManager.location
            if let loc = currentLocation {
                postVM.loadFeed(for: loc)
            }
        }
    }
}

struct PostRow: View {
    let post: Post
    @State private var distanceText: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text(post.content)
            Text(distanceText)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .onAppear {
            // compute distance without revealing author location
            if let userLocation = CLLocationManager().location {
                let postLocation = CLLocation(latitude: post.location.latitude,
                                             longitude: post.location.longitude)
                let distance = userLocation.distance(from: postLocation) / 1000
                distanceText = String(format: "%.1f km away", distance)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedView()
        }
    }
}
