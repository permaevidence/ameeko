import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showRegister: Bool = false
    @State private var isLoggedIn: Bool = false
    @EnvironmentObject var userVM: UserViewModel
    @State private var loginFailed: Bool = false

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Login") {
                userVM.login(email: email, password: password)
                if userVM.currentUser != nil {
                    isLoggedIn = true
                } else {
                    loginFailed = true
                }
            }
            .alert(isPresented: $loginFailed) {
                Alert(title: Text("Login Failed"),
                      message: Text("Invalid credentials"),
                      dismissButton: .default(Text("OK")))
            }
            Button("Create Account") {
                showRegister = true
            }
            .sheet(isPresented: $showRegister) {
                RegisterView()
                    .environmentObject(userVM)
            }
            NavigationLink("", destination: MainTabView().environmentObject(userVM), isActive: $isLoggedIn)
                .hidden()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserViewModel())
    }
}
