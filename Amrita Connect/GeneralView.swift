//
//  EducationalView.swift
//  Amrita Connect
//
//  Created by Siddharth on 07/06/22.
//

import SwiftUI

struct GeneralView: View {
    var body: some View {
        
        NavigationView
        {
            
            
            ZStack
             {
                 
              
                 HStack
                 {
                     Image("logo")
                         .resizable()
                         .aspectRatio(contentMode: .fill)
                         .opacity(0.15)
                         
                
                         
                    
                 }
              
                 
                 VStack(spacing:30)
                 {
                    
                     
                     
                     
                     
                     HStack(spacing:30)
                     {
                         NavigationLink(destination: BroadcastView())
                         {
                            
                                 
                                 VStack
                                 {
                                     ZStack{
                                     Rectangle()
                                             .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 148/255, blue: 130/255), Color(red: 125/255, green: 119/255, blue: 250/255)]),
                                                                  startPoint: .bottomLeading,
                                                                                   endPoint: .topLeading))
                                             .frame(width: 90, height: 90, alignment: .center)
                                             .cornerRadius(20)
                                         .cornerRadius(20)
                                         .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                         Image(systemName: "message")
                                                      .scaleEffect(2)
                                                      .foregroundColor(.white)
                                 }
                                     Text("Broadcast")
                                         .foregroundColor(.black)
                                
                             }
                                 
                                 
                                   
                             
                                 
                            
                            
                         }
                         
                         NavigationLink(destination: MapView())
                         {
                            
                                 
                                 VStack
                                 {
                                     ZStack{
                                     Rectangle()
                                             .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 148/255, blue: 130/255), Color(red: 125/255, green: 119/255, blue: 250/255)]),
                                                                  startPoint: .topTrailing,
                                                                                   endPoint: .bottomLeading))
                                         .frame(width: 90, height: 90, alignment: .center)
                                         .cornerRadius(20)
                                         .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                         Image(systemName: "map")
                                                      .scaleEffect(2)
                                                      .foregroundColor(.white)
                                 }
                                     Text("Map")
                                         .foregroundColor(.black)
                                
                             }
                                 
                                 
                                   
                             
                                 
                            
                            
                         }
                         NavigationLink(destination: TimingView())
                         {
                            
                                 
                                 VStack
                                 {
                                     ZStack{
                                     Rectangle()
                                             .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 148/255, blue: 130/255), Color(red: 125/255, green: 119/255, blue: 250/255)]),
                                                                  startPoint: .bottomLeading,
                                                                                   endPoint: .topLeading))
                                             .frame(width: 90, height: 90, alignment: .center)
                                             .cornerRadius(20)
                                         .cornerRadius(20)
                                         .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                         Image(systemName: "clock")
                                                      .scaleEffect(2)
                                                      .foregroundColor(.white)
                                 }
                                     Text("Timing")
                                         .foregroundColor(.black)
                                
                             }
                                 
                                 
                                   
                             
                                 
                            
                            
                         }
                         
                         
                     }
                     
                     Spacer()
                     
                 }
                 .padding(.top,50)
                 
             }
             .navigationTitle("General")
           
        }
        
       
      
        
        
        
        
    }
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}
