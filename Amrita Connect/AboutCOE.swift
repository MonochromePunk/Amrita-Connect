//
//  DeveloperView.swift
//  Amrita Connect
//
//  Created by Siddharth on 07/06/22.
//

import SwiftUI

struct AboutCOEView: View {
    @State var count = 0
    let bulletPoint: String = "\u{2022}"
    
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
                    
                    Text("About Deputy COE")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(.bottom)
                        .padding(.top, 90)
                    Text("The Office of Deputy Controller of Examinations is responsible for the conduct of Examinations ( Periodicals, End Semester and Supplementary) for all the programs offered by Amrita Vishwa Vidyapeetham, Coimbatore Campus.    ")
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
                            Text("Dy.CoE Office is responsible for the issue of :")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.top,80)
                                .padding(.bottom)
                            
                            VStack{
                                
                                HStack
                                {
                                    Text(bulletPoint)
                                        .font(.title)
                                    Text("Exam Admit Cards")
                                    Spacer()
                                }
                                HStack
                                {
                                    Text(bulletPoint)
                                        .font(.title)
                                    Text("Grade Sheets, Consolidated Grade Sheets and Provisional Certificates")
                                    Spacer()
                                }
                                
                                HStack
                                {
                                    Text(bulletPoint)
                                        .font(.title)
                                    Text("Transcripts.**")
                                    Spacer()
                                }
                                
                                HStack
                                {
                                    Text(bulletPoint)
                                        .font(.title)
                                    Text("Duplicate Certificates.")
                                    Spacer()
                                }
                                
                                HStack
                                {
                                    Text(bulletPoint)
                                        .font(.title)
                                    Text("Conversion Certificate (CGPA to Percentage).")
                                    Spacer()
                                }
                                
                                HStack
                                {
                                    Text(bulletPoint)
                                        .font(.title)
                                    Text("Rank Certificate")
                                    Spacer()
                                }
                                
                                HStack
                                {
                                    Text(bulletPoint)
                                        .font(.title)
                                    Text("Attestation for Certificates")
                                    Spacer()
                                }
                                
                                    
                                    
                                    
                                    
                                }
                            .padding(.leading)
                            
                            
                            Text("**Transcripts directly to foreign universities, WES applications and certificate verification contact Controller of Examination's office( coe@amrita.edu)")
                                .padding(.top)
                                .padding(.horizontal)
                               
                                
                                
                            
                            
                            
                            Text("For WES application and verification, contact Controller of Examination's office (coe@amrita.edu)")
                                .padding(.top)
                                .padding(.horizontal)
                            
                            
                            Text("Source: https://intranet.cb.amrita.edu")
                                .padding(.top, 30)
                               
                           
                           
                            
                        }
                        .padding(.bottom, 50)
                        
                       
                            
                    }
                    
                      
                    
                        
                    
                        
                }
                
                
                
                
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        
        
        
       
    }
}

struct AboutCOEView_Previews: PreviewProvider {
    static var previews: some View {
        AboutCOEView()
    }
}
