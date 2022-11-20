//
//  BroadcastView.swift
//  Amrita Connect
//
//  Created by Siddharth on 06/06/22.
//

import SwiftUI

struct BroadcastView: View {

    @StateObject var messagesManager = MessagesManager()
    var body: some View {
       
            
           NavigationView
        {
            VStack {
                VStack
                    {
                        TitleView()
                            
                        ScrollViewReader { proxy in
                            ScrollView()
                            {
                               
                                ForEach(messagesManager.messages, id: \.id)
                                {
                                    message in
                                   
                                    MessageBubbleView(message: message)
                                }
                            }
                            .padding(.top, 10)
                            .background(.white)
                        .cornerRadius(radius: 30, corners: [.topLeft, .topRight])
                        .onChange(of: messagesManager.lastMessagesId){
                            
                            
                            
                            id in
                            withAnimation {
                                proxy.scrollTo(id, anchor: .bottom)
                            }
                           
                        }
                        }
                    }.background( LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 148/255, blue: 130/255), Color(red: 125/255, green: 119/255, blue: 250/255)]),
                                                 startPoint: .topTrailing,
                                                                  endPoint: .leading))
                MessageField()
                    .environmentObject(messagesManager)
            }

        }
        //.navigationBarHidden(true)
               
      
           
        
    }
}

struct BroadcastView_Previews: PreviewProvider {
    static var previews: some View {
        BroadcastView()
    }
}
