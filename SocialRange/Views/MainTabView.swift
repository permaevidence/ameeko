import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationView { FeedView() }
                .tabItem {
                    Label("Feed", systemImage: "list.bullet")
                }
            NavigationView { MessageListView() }
                .tabItem {
                    Label("Messages", systemImage: "bubble.left.and.bubble.right")
                }
            NavigationView {
                if let user = UserViewModel().currentUser {
                    ProfileView(user: user)
                } else {
                    Text("No profile")
                }
            }
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
