//
//  MessageBubbleView.swift
//  Amrita Connect
//
//  Created by Vaisakhkrishnan K on 08/06/22.
//

import SwiftUI

struct MessageBubbleView: View {
    var message:Message
    
    //user
    
    var rollno:String = "CB.EN.U4CSE20070"
    @State var align: Bool = true
  
    @State private var showTime = false
    var body: some View {
       
        
      
        
        
        VStack(alignment: message.user != rollno ? .leading : .trailing)
        {
            HStack
            {
                
                
                Text(message.text)
                    .padding()
                    .background(message.user != rollno ? Color(red: 245/255, green: 245/255, blue: 245/255) : Color(red: 255/255, green: 136/255, blue: 134/255))
                    .cornerRadius(30)
                
            }
            .frame(maxWidth: 300, alignment: message.user != rollno ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            Text(message.user)
                .font(.caption2)
                .foregroundColor(.gray)
                .padding(message.user != rollno ? .leading : .trailing, 10)
            
            if showTime{
                Text("\(message.time.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.user != rollno ? .leading : .trailing, 10)
            }
           
        }
        .frame(maxWidth: .infinity, alignment: message.user != rollno ? .leading : .trailing)
        .padding(message.user != rollno ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubbleView(message: Message(id: "key", text: "key", recieved: false, time: Date(), user: "temp"))
    }
}
