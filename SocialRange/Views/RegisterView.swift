import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userVM: UserViewModel
    @State private var showMismatchAlert: Bool = false

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Register") {
                guard password == confirmPassword else {
                    showMismatchAlert = true
                    return
                }
                userVM.register(email: email, password: password)
                dismiss()
            }
            .alert(isPresented: $showMismatchAlert) {
                Alert(title: Text("Passwords do not match"))
            }
        }
        .padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserViewModel())
    }
}
