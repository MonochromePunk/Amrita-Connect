//
//  DeveloperView.swift
//  Amrita Connect
//
//  Created by Siddharth on 07/06/22.
//

import SwiftUI

struct DeveloperView: View {
    @State var count = 0
    var body: some View {
        
        
        ScrollView
        {
            ZStack
            {
                LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 148/255, blue: 130/255), Color(red: 125/255, green: 119/255, blue: 250/255)]),
                    startPoint: .topTrailing,
                                     endPoint: .leading)
                .edgesIgnoringSafeArea(.all)
                
                VStack
                {
                    
                    Text("Developers Forum")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(.bottom)
                        .padding(.top, 90)
                    Text("Amrita Connect is an app developed by the students of Amrita Vishwa Vidyapeetham, under the Guidance of K Abirami, Assistant Professor, Amrita Vishwa Vidyapeetham\n\nFeel free to contact us for any issues regarding Amrita Connnect. Thankyou!")
                        .font(.body)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                    
                    
                    ZStack
                    {
                       Rectangle()
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .edgesIgnoringSafeArea(.all)
                            .padding(.top, 30)
                       
                        VStack
                        {
                            Text("Meet Us")
                                .font(.title)
                                .fontWeight(.light)
                                .padding(.top,80)
                                .padding(.bottom,40)
                            
                            HStack(spacing:20)
                            {
                                Image("me")
                                    .resizable()
                                    .frame(width: 130, height: 165, alignment: .center)
                                    .cornerRadius(20)
                                VStack
                                {
                                    Text("K Vaisakhkrishnan")
                                        .font(.headline)
                                     Text("CB.EN.U4CSE20069\nCSE, ASE, Coimbatore")
                                }
                            }
                            
                            HStack(spacing:20)
                            {
                                
                                   
                                VStack
                                {
                                    Text("Mithun Menon M")
                                        .font(.headline)
                                     Text("CB.EN.U4CSE20142\nCSE, ASE, Coimbatore")
                                }
                                Image("manu")
                                    .resizable()
                                    .frame(width: 130, height: 165, alignment: .center)
                                    .cornerRadius(20)
                            }
                            
                            
                            Image("logo")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                                .padding(.top,50)
                               
                            
                            Text("Version 1.0.0")
                                .font(.headline)
                                Spacer()
                           HStack
                            {
                                Spacer()
                                Image(systemName: "c.circle")
                                    .padding(.bottom,100)
                                Text("Amrita Vishwa Vidyapeetham")
                                    .padding(.bottom,100)
                                Spacer()
                            }
                            
                            
                        }
                            
                    }
                      
                    
                        
                    
                        
                }
                
                
                
                
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        
        
        
       
    }
}

struct DeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperView()
    }
}
