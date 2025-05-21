import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var userVM: UserViewModel

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
                if let user = userVM.currentUser {
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
            .environmentObject(UserViewModel())
    }
}
