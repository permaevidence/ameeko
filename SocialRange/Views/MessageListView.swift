import SwiftUI

struct MessageListView: View {
    @StateObject var messageVM = MessageViewModel()
    var body: some View {
        List {
            ForEach(messageVM.conversations.keys.sorted(), id: \.
self) { userID in
                NavigationLink(destination: ConversationView(userID: userID)) {
                    Text("Conversation with \(userID.uuidString.prefix(6))")
                }
            }
        }
        .navigationTitle("Messages")
        .onAppear {
            // TODO: load conversation list
        }
    }
}

struct ConversationView: View {
    @StateObject var messageVM = MessageViewModel()
    let userID: UUID
    @State private var messageText: String = ""

    var body: some View {
        VStack {
            List(messageVM.conversations[userID] ?? []) { message in
                Text(message.content)
            }
            HStack {
                TextField("Message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Send") {
                    messageVM.sendMessage(to: userID, content: messageText)
                    messageText = ""
                }
            }
            .padding()
        }
        .navigationTitle("Chat")
        .onAppear {
            messageVM.loadMessages(with: userID)
        }
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageListView()
        }
    }
}
