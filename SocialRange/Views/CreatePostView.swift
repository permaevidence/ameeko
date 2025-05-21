import SwiftUI
import CoreLocation

struct CreatePostView: View {
    @State private var content: String = ""
    @State private var rangeText: String = "5"
    @State private var locationManager = CLLocationManager()
    @State private var currentLocation: CLLocation?
    @Environment(\.dismiss) var dismiss
    @StateObject var postVM = PostViewModel()

    var body: some View {
        Form {
            Section(header: Text("Content")) {
                TextField("What do you want to do?", text: $content)
            }
            Section(header: Text("Visibility Range (km)")) {
                TextField("Range", text: $rangeText)
                    .keyboardType(.decimalPad)
            }
            Button("Post") {
                if let location = locationManager.location,
                   let range = Double(rangeText) {
                    postVM.createPost(content: content, location: location, range: range)
                    dismiss()
                }
            }
        }
        .navigationTitle("New Post")
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
            currentLocation = locationManager.location
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { CreatePostView() }
    }
}
