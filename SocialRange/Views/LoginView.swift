import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showRegister: Bool = false
    @State private var isLoggedIn: Bool = false

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Login") {
                // handle login
                isLoggedIn = true
            }
            Button("Create Account") {
                showRegister = true
            }
            .sheet(isPresented: $showRegister) {
                RegisterView()
            }
            NavigationLink("", destination: MainTabView(), isActive: $isLoggedIn)
                .hidden()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
