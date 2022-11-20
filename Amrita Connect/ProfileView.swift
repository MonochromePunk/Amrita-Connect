//
//  ProfileView.swift
//  Amrita Connect
//
//  Created by Siddharth on 07/06/22.
//

import SwiftUI

struct ProfileView: View {
    var name: String = "K Vaisakhkrishnan"
    var roll: String = "CB.EN.U4CSE20069"
    var body: some View {
       
            
           
               
            VStack {
                ZStack
                {
                    LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 148/255, blue: 130/255), Color(red: 125/255, green: 119/255, blue: 250/255)]),
                        startPoint: .topTrailing,
                                         endPoint: .leading)
                    .edgesIgnoringSafeArea(.all)
                    
                    
                    VStack
                    {
                        Image("me")
                            .resizable()
                        
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 130, height: 130, alignment: .center)
                            .cornerRadius(170)
                            .padding(.top,70)
                            .padding(.bottom,10)
                    
                        Text(name)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text(roll)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.bottom)
                    }
                   
            }
                .frame(width: .infinity, height: 300, alignment: .center)
                
                
               
                List {
                           Section(header: Text("General Details")) {
                               
                               
                               HStack
                                                          {
                                                              Text("Mobile : ")
                                                             Spacer()
                                                              Text("+91 8129348583")
                                                          }
                                                          
                                                          HStack
                                                          {
                                                              Text("Email : ")
                                                             Spacer()
                                                              Text("kvaisakhkrishnan@gmail.com")
                                                          }
                                                          
                                                          HStack
                                                          {
                                                              Text("Gender : ")
                                                             Spacer()
                                                              Text("Male")
                                                          }
                                                          
                                                          HStack
                                                          {
                                                              Text("Admitted Campus : ")
                                                             Spacer()
                                                              Text("Coimbatore")
                                                          }
                                                          
                                                          HStack
                                                          {
                                                              Text("Academic Program : ")
                                                             Spacer()
                                                              Text("B Tech")
                                                          }
                                                          HStack
                                                          {
                                                              Text("Branch : ")
                                                             Spacer()
                                                              Text("Computer Science and Engineering")
                                                          }
                                                          HStack
                                                          {
                                                              Text("Section : ")
                                                             Spacer()
                                                              Text("A")
                                                          }
                                                          
                                                          HStack
                                                          {
                                                              Text("Joining Year : ")
                                                             Spacer()
                                                              Text("2020")
                                                          }
                                                          
                                                          HStack
                                                          {
                                                              Text("Class Advisor : ")
                                                             Spacer()
                                                              Text("NALINADEVI K")
                                                          }
                                                          HStack
                                                          {
                                                              Text("Date of Birth : ")
                                                             Spacer()
                                                              Text("27-10-2001")
                                                          }

                               
                          
                           }
                    
                    Section(header: Text("Academic Details")) {
                        
                        
                        HStack
                        {
                            Text("Current Semester : ")
                           Spacer()
                            Text("4")
                        }
                        
                        HStack
                        {
                            Text("CGPA : ")
                           Spacer()
                            Text("9.25")
                        }
                        HStack
                        {
                            Text("SGPA : ")
                           Spacer()
                            Text("View All")
                        }
                        HStack
                        {
                            Text("Current Arrears : ")
                           Spacer()
                            Text("0")
                        }
                        HStack
                        {
                            Text("Total Arrears : ")
                           Spacer()
                            Text("0")
                        }
                        
                   
                    }
                    
                    
                    Section(header: Text("Disciplinary Actions")) {
                   
                        
                        HStack
                        {
                            Text("Total Actions : ")
                           Spacer()
                            Text("0")
                            
                        }
                        HStack
                        {
                            Text("Current Status : ")
                           Spacer()
                            Text("Inactive")
                        }
                    }
                    
                    Section(header: Text("Hostel Details")) {
                        
                        HStack
                        {
                            Text("Hostel : ")
                           Spacer()
                            Text("Vasishta Bhavanam")
                        }
                        HStack
                        {
                            Text("Room No : ")
                           Spacer()
                            Text("A107")
                        }
                        HStack
                        {
                            Text("Warden : ")
                           Spacer()
                            Text("Mr Gopalakrishnan E")
                        }
                        HStack
                        {
                            Text("Chief Faculty Warden(s) : ")
                           Spacer()
                            Text("ADARSH S")
                        }
                   
                    }
                    
                    Section(header: Text("Father Details (Primary Contact)")) {
                        
                        HStack
                        {
                            Text("Name : ")
                           Spacer()
                            Text("Mr Krishnaumar V")
                        }
                        HStack
                        {
                            Text("Mobile : ")
                           Spacer()
                            Text("9446360568")
                        }
                        HStack
                        {
                            Text("Email : ")
                           Spacer()
                            Text("kkkumarv@yahoo.com")
                        }
                   
                    }
                    
                    Section(header: Text("Mother Details")) {
                        HStack
                        {
                            Text("Name : ")
                           Spacer()
                            Text("Savitha S")
                        }
                        HStack
                        {
                            Text("Mobile : ")
                           Spacer()
                            Text("7736361761")
                        }
                        HStack
                        {
                            Text("Email : ")
                           Spacer()
                            Text("savithas051972@gmail.com")
                        }
                    }
                    
                    Section(header: Text("Other Details")) {
                        HStack
                        {
                            Text("Communication Address : ")
                           Spacer()
                            Text("Kiliyattuveliyil\nAmbalappuzha,\nAlappuzha, Kerala, India\nPincode : 688003")
                        }
                        HStack
                        {
                            Text("Permanent Address : ")
                           Spacer()
                            Text("Kiliyattuveliyil\nAmbalappuzha,\nAlappuzha, Kerala, India\nPincode : 688003")
                        }
                        HStack
                        {
                            Text("Total Passes Taken : ")
                           Spacer()
                            Text("14")
                            
                        }
                        HStack
                        {
                            Text("Status : ")
                           Spacer()
                            Text("IN")
                        }
                    }
                    
                    
                       }
                       .listStyle(.grouped)
                
                
                
                      
                        
                        
                        
                        
                        
                
                
               
               
                
              
                
            }
            .edgesIgnoringSafeArea(.top)
           
           
   
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
           
            
    }
}
