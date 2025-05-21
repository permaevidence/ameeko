import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userVM: UserViewModel

    var body: some View {
        if userVM.currentUser != nil {
            MainTabView()
                .environmentObject(userVM)
        } else {
            NavigationView {
                LoginView()
            }
            .environmentObject(userVM)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserViewModel())
    }
}
