//
//  MessageField.swift
//  Amrita Connect
//
//  Created by Vaisakhkrishnan K on 08/06/22.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @State private var message=""
    
    var body: some View {
        
        HStack
        {
            CustomTextField(placeholder: Text("Enter you message"), text: $message)
            Button {
                messagesManager.sendMessages(text: message)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color(red: 255/255, green: 136/255, blue: 134/255))
                    .cornerRadius(50)
            }

        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(Color(red: 245/255, green: 245/255, blue: 245/255))
        .cornerRadius(50)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(MessagesManager())
    }
}

struct CustomTextField: View
{
    var placeholder : Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View{
        ZStack(alignment: .leading)
        {
            if text.isEmpty
            {
                placeholder.opacity(0.5)
                
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
