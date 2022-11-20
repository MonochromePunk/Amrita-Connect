//
//  MessagesManager.swift
//  Amrita Connect
//
//  Created by Siddharth on 08/06/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI


class MessagesManager: ObservableObject{
    
    //username
  var rollno:String = "CB.EN.U4CSE20070"
    
    
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessagesId = ""
    let db = Firestore.firestore()
    init()
    {
        getMessages()
    }
    
    func getMessages()
    {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else{
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do{
                    return try document.data(as: Message.self)
                } catch {
                    print("Error fetching documents: \(error)")
                    return nil
                }
                
            }
            
            
            self.messages.sort { $0.time < $1.time}
            
            
            if let id = self.messages.last?.id {
                self.lastMessagesId = id
                
            }
        }
    }
    
    func sendMessages(text: String)
    {
        do{
            if(text != ""){
            let newMessage = Message(id: "\(UUID())", text: text, recieved: false, time: Date(), user: rollno)
            try db.collection("messages").document().setData(from: newMessage)
            }
            
        } catch{
            print("Error adding messages to firestore: \(error)")
        }
    }
}
