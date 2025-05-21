import SwiftUI

@main
struct SocialRangeApp: App {
    @StateObject private var userVM = UserViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userVM)
        }
    }
}
