//
//  MainView.swift
//  Amrita Connect
//
//  Created by Siddharth on 05/06/22.
//

import SwiftUI
import SwiftSoup
import UserNotifications

struct Announcement : Identifiable{
    var id : UUID
    var count : Int
    var message : String
    var link : String
}
struct MainView: View {
    @State var link : String = ""
    var containerWidth:CGFloat = UIScreen.main.bounds.width - 32.0
    @State var annc = [Announcement]()
    @State var name:String = "K Vaisakhkrishnan"
    @State var roll:String = "CB.EN.U4CSE20069"
    @State var from:Int = 2020
    @State var till:Int = 2024
    @State private var textSwitch = false
    var body: some View {
        NavigationView
        {
           

           
            ScrollView {
                
                VStack
                      {
                          
                          Image("amritadraw")
                              .resizable()
                              .frame(width: 400, height: 150, alignment: .center)
                              .padding(.vertical,20)
                              .padding(.bottom,10)
                          
                    
                         
                         NavigationLink(destination: ProfileView()){
                             
                             
                             
                             
                              ZStack
                              {
                                  
                                  
                                  Rectangle()
                                      .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 148/255, blue: 130/255), Color(red: 125/255, green: 119/255, blue: 250/255)]),
                                                           startPoint: .topTrailing,
                                                                            endPoint: .bottomLeading))
                                      .frame(width: 345, height: 215, alignment: .center)
                                      .cornerRadius(25)
                                      .shadow(color: .black, radius: 7, x: 0, y: 0)
                                  
                                  VStack{
                                      
                                      Text("AVV")
                                          .font(.title2)
                                          .foregroundColor(.white)
                                          .padding(.leading,250)
                                          .padding(.bottom,30)
                                      Text(roll)
                                          .font(.title2)
                                          .foregroundColor(.white)
                                          .padding(.trailing,100)
                                          
                                      Text(name)
                                          .font(.headline)
                                          .foregroundColor(.white)
                                          .padding(.trailing,155)
                                          .padding(.bottom,20)
                                          
                                      HStack(spacing: 30)
                                      {
                                          VStack
                                          {Text("Valid from")
                                                  .font(.footnote)
                                                  .fontWeight(.bold)
                                                  .foregroundColor(.white)
                                              Text(String(from))
                                                  .font(.footnote)
                                                  .fontWeight(.bold)
                                                  .foregroundColor(.white)
                                          }
                                      
                                          VStack
                                          {Text("Valid till")
                                                  .font(.footnote)
                                                  .fontWeight(.bold)
                                                  .foregroundColor(.white)
                                              Text(String(till))
                                                  .font(.footnote)
                                                  .fontWeight(.bold)
                                                  .foregroundColor(.white)
                                          }
                                      }
                                  }
                              }
                          }

                             
                              
                                  
                              
                              Rectangle()
                                  .padding(.top,40)
                                .edgesIgnoringSafeArea(.all)
                                  .foregroundColor(.white)
                              
                        


                             
                         
                          
                          
                          
                          
                          
                          
                          
                          
                          //Announcements
                          
                        
                          Text("Announcements")
                              .font(.title)
                              .fontWeight(.semibold)
                              .padding(.bottom, 10)
                          
                          
                         
                          
                          
                          
                        
                         
                        
                       
                          
                          VStack{
                              
                              ForEach(annc, id: \.self.id){ value in
                              
                                  Button {
                                      link = value.link
                                  } label: {
                                    
                                  

                              
                              HStack
                                {
                                 
                                    
                                    ZStack
                                    {
                                        Circle()
                                            .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 148/255, blue: 130/255), Color(red: 125/255, green: 119/255, blue: 250/255)]),
                                                                 startPoint: .topTrailing,
                                                                                  endPoint: .bottomLeading))
                                            .frame(width:100, height: 55, alignment: .center)
                                           
                                        
                                        Text(String(value.count))
                                            .foregroundColor(.white)
                                        
                                        
                                        
                                            
                                    }
                                   

                                    Text(value.message)
                                        .padding(.vertical,10)
                                        .foregroundColor(.black)
                                        
                                    Spacer()
                                    
                                    
                                }
                                  }
                                  
                                  .onChange(of: link, perform: { newValue in
                                      openLink()
                                  })
                               
                                .frame(width: containerWidth * 1)
                               
                                .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                                .padding(.vertical, 5)
                                .cornerRadius(140)
                                
                              }
                                  
                                  
                              
                           
                              }
                          
                              
                              
                              
                             
                          
                          
                        
                        
                          
                         
                          
                          
                          
                        
                          
                          
                          
                      }
                     
                      
                          .navigationTitle("Home")
                          .padding(.top)
                
               
              
                
                
            }
           
      
               
            
           
        }
        .task{
            await loadAnnouncements()
        }
      
      
        
        
       
    }
    
    func loadAnnouncements() async
    {
        
        guard let url = URL(string: "https://intranet.cb.amrita.edu/") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            do{
                let str = String(decoding: data, as: UTF8.self);
                let doc: Document = try SwiftSoup.parse(str);
                var pos = 1;
                annc = [Announcement]()
                for i in try doc.getElementsByClass("list-group-item")
                {
                    annc.append(Announcement(id: UUID(), count: pos, message: try i.select("a").text(), link: try i.select("a").attr("href")))
                    pos+=1
                }
                print(annc)
                
                
                
               
            }
            catch{
                print("Error")
            }
        
        
           
        } catch {
            print("Invalid data")
        }
        
        
    }
    
    func openLink()
    {var newlink = "https://intranet.cb.amrita.edu"
        if(link.contains("intranet"))
        {
            newlink = link
        }
        else
        {
            newlink = newlink + link
        }
        
        print("\n\n\n\n")
       
        if let url2 = URL(string: newlink) {
            UIApplication.shared.open(url2)
        }
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
