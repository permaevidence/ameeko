import SwiftUI

struct PostDetailView: View {
    let post: Post
    @State private var commentText: String = ""
    @StateObject var postVM = PostViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text(post.content)
                .font(.title)
            Text("Comments")
                .font(.headline)
            List {
                // TODO: show comments
            }
            HStack {
                TextField("Add a comment", text: $commentText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Send") {
                    postVM.addComment(post: post, content: commentText)
                    commentText = ""
                }
            }
            .padding()
        }
        .navigationTitle("Post")
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: Post(id: UUID(), authorID: UUID(), content: "Test", createdAt: Date(), location: Location(latitude: 0, longitude: 0), rangeInKilometers: 5))
    }
}
