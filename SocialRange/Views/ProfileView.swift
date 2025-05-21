import SwiftUI

struct ProfileView: View {
    var user: User

    var body: some View {
        VStack {
            if let url = user.profile.avatarURL {
                if #available(iOS 15.0, *) {
                    AsyncImage(url: url) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        Image(systemName: "person.crop.circle")
                    }
                    .frame(width: 100, height: 100)
                } else {
                    Image(systemName: "person.crop.circle")
                }
            } else {
                Image(systemName: "person.crop.circle")
            }
            Text(user.profile.name)
                .font(.title)
            Text(user.profile.bio)
        }
        .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: UUID(), email: "test@example.com", profile: Profile(name: "Test", bio: "Bio", avatarURL: nil), location: nil)
        ProfileView(user: user)
    }
}
