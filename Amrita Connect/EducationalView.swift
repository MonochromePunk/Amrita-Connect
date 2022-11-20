//
//  EducationalView.swift
//  Amrita Connect
//
//  Created by Siddharth on 07/06/22.
//

import SwiftUI

struct EducationalView: View {
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
                         NavigationLink(destination: AUMSView())
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
                                         Image(systemName: "graduationcap")
                                             .scaleEffect(2)
                                                      .foregroundColor(.white)
                                 }
                                     Text("AUMS")
                                         .foregroundColor(.black)
                                
                             }
                                 
                                 
                                   
                             
                                 
                            
                            
                         }
                         
                         NavigationLink(destination: CMSView())
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
                                         Image(systemName: "building.columns")
                                                      .scaleEffect(2)
                                                      .foregroundColor(.white)
                                 }
                                     Text("CMS")
                                         .foregroundColor(.black)
                                
                             }
                                 
                                 
                                   
                             
                                 
                            
                            
                         }
                         NavigationLink(destination: TimeTableView(search: ""))
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
                                         Image(systemName: "calendar")
                                                      .scaleEffect(2)
                                                      .foregroundColor(.white)
                                 }
                                     Text("Time Table")
                                         .foregroundColor(.black)
                                
                             }
                                 
                                 
                                   
                             
                                 
                            
                            
                         }
                         
                         
                     }
                     
                     
                     
                     HStack(spacing:30)
                     {
                         NavigationLink(destination: LibraryView())
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
                                         Image(systemName: "books.vertical")
                                                      .scaleEffect(2)
                                                      .foregroundColor(.white)
                                 }
                                     Text("Library")
                                         .foregroundColor(.black)
                                
                             }
                                 
                                 
                                   
                             
                                 
                            
                            
                         }
                         
                         NavigationLink(destination: CurriculumView())
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
                                         Image(systemName: "newspaper")
                                                      .scaleEffect(2)
                                                      .foregroundColor(.white)
                                 }
                                     Text("Curriculum")
                                         .foregroundColor(.black)
                                
                             }
                                 
                                 
                                   
                             
                                 
                            
                            
                         }
                         NavigationLink(destination: ExamView())
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
                                         Image(systemName: "pencil")
                                                      .scaleEffect(2)
                                                      .foregroundColor(.white)
                                 }
                                     Text("Exam")
                                         .foregroundColor(.black)
                                
                             }
                                 
                                 
                                   
                             
                                 
                            
                            
                         }
                         
                         
                     }
                     
                     
                    
                    
                         
                         
                   
                         
                      
                     
                    HStack
                     {
                         NavigationLink(destination: FacultyView(search: ""))
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
                                         Image(systemName: "person.crop.rectangle.stack")
                                                      .scaleEffect(2)
                                                      .foregroundColor(.white)
                                 }
                                     Text("Faculty\nTime Table")
                                         .foregroundColor(.black)
                                
                             }
                                 
                                 
                                   
                             
                                 
                            
                            
                         }
                         .padding(.trailing,240)
                         
                         
                        
                        
                     }
                     
                     
                    
                    
                     Spacer()
                    
                 }
                 .navigationTitle("Education")
                 .padding(.top,50)
             }
            
            
           
           
        }
        
      
        
        
        
        
    }
}

struct EducationalView_Previews: PreviewProvider {
    static var previews: some View {
        EducationalView()
    }
}
