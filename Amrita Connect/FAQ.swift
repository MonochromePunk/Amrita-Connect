
//
//  DeveloperView.swift
//  Amrita Connect
//
//  Created by Siddharth on 07/06/22.
//

import SwiftUI

struct FAQView: View {
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
                    
                    Text("Frequently Asked Questions")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(.bottom)
                        .padding(.top, 90)
                    
                    
                    ZStack
                    {
                       Rectangle()
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .edgesIgnoringSafeArea(.all)
                            .padding(.top, 30)
                       
                        VStack
                        {
                            Text("Various Queries Raised")
                                .font(.title2)
                                .padding(.top,80)
                                .padding(.bottom,40)
                            
                            VStack{
                                
                                VStack{
                                    HStack{
                                        Text("How do I write Examination without ID Card/ in the event of lose of id Card?")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 10)
                                        Spacer()
                                    }
                                    HStack{
                                        Text("- ")
                                        Text("If the identity card is lost, He / She has to write a letter to Deputy Controller of Examinations with the recommendation from Department Chairperson and also to produce proof that the student has applied for new ID card.")
                                        Spacer()
                                    }
                                    .padding(.bottom)
                                   
                                }
                                
                                
                                
                                
                                
                                
                                VStack{
                                    HStack{
                                        Text("How do I write Examinations without Hall Ticket(lost or Forgot to bring)?")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 10)
                                        Spacer()
                                    }
                                    HStack{
                                        Text("- ")
                                        Text("If the student lost the Hall Ticket he/she has to apply for Duplicate Hall ticket at Deputy Controller’s Office, where he can get the application form for Duplicate Hall Ticket.")
                                        
                                        Spacer()
                                    }
                                   
                                    
                                    HStack{
                                        Text("- ")
                                        Text("In order to get the Duplicate Hall Ticket the student has to make the necessary payment in the Accounts Section.")
                                        
                                        Spacer()
                                    }
                                    .padding(.top)
                                    .padding(.bottom)
                                   
                                }
                                
                                
                                
                                
                                
                                VStack{
                                    HStack{
                                        Text("Is it Compulsory to wear uniform to enter into the Examination Hall?")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 10)
                                        Spacer()
                                    }
                                    HStack{
                                        Text("- ")
                                        Text("Uniform is compulsory to appear for the Exam, otherwise the student will not be allowed to enter the Exam Hall.")
                                        Spacer()
                                    }
                                    .padding(.bottom)
                                    
                                   
                                }
                                
                                
                                
                                VStack{
                                    HStack{
                                        Text("What should I do if I can’t write the periodical exams?")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 10)
                                        Spacer()
                                    }
                                    HStack{
                                        Text("- ")
                                        Text("Go to your Department office where you can get the third assessment application form..")
                                        Spacer()
                                    }
                                    .padding(.bottom)
                                    HStack{
                                        Text("- ")
                                        Text("Fill the mandatory columns")
                                        Spacer()
                                    }
                                    .padding(.bottom)
                                    HStack{
                                        Text("- ")
                                        Text("Get the approval from the concerned faculty, who was handled that particular subject and submit the same to your Department office.")
                                        Spacer()
                                    }
                                    .padding(.bottom)
                                    HStack{
                                        Text("- ")
                                        Text("Note: Apply for the third assessment exams within five office working days after the exams.")
                                        Spacer()
                                    }
                                    .padding(.bottom)
                                    
                                   
                                }
                                
                                
                                VStack{
                                    HStack{
                                        Text("What is the duration for applying Revaluation?")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 10)
                                        Spacer()
                                    }
                                    HStack{
                                        Text("- ")
                                        Text("Apply within five days after the declaration of results.")
                                            .padding(.bottom)
                                    }
                                   
                                   
                                }
                                
                                
                                VStack{
                                    HStack{
                                        Text("How do I pay for revaluating my answer sheets?")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 10)
                                        Spacer()
                                    }
                                    .padding(.bottom)
                                    HStack{
                                        Text("- ")
                                        Text("Revaluation applicable only for End semester courses not applicable for Lab courses/ Supplementary courses.")
                                        Spacer()
                                    }
                                    .padding(.bottom)
                                   
                                    HStack{
                                        Text("- ")
                                        Text("Revaluation Fee: Rs.300/- per course.")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            
                                        Spacer()
                                    }
                                    .padding(.bottom)
                                    HStack{
                                        Text("- ")
                                        Text("Payment options: Online/RTGS/NEFT only")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                           
                                    }
                                    .padding(.bottom)
                                   
                                    
                                }
                                
                                
                                
                                
                                
                                
                            }
                            .padding(.bottom, 30)
                            Text("Account Number: Register Number E Example Account Number: CBENU4CSE17540E")
                            Text("Bank: Dhanlaxmi Bank, Trissur IFSC: DLXB0000996 Account Type: Savings")
                                .padding(.bottom)
                            Text("When should I approach Dy. CoE for enquiring clarification regarding Examination etc?")
                                .padding(.bottom)
                                .font(.headline)
                               
                            
                            HStack{
                                Text("- ")
                                Text("As per the Academic Calendar anytime between 9.00 am to 5.00 pm.")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding(.bottom)
                            
                            HStack{
                                Text("- ")
                                Text("If the student is out of station he can approach via mail @ dycoe@cb.amrita.edu.")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            
                            Text("Source: https://intranet.cb.amrita.edu")
                                .padding(.top, 30)
                            
                        }
                        .padding(.bottom, 50)
                        .padding(.horizontal)
                        
                       
                            
                    }
                  
                    
                      
                    
                        
                    
                        
                }
                
                
                
                
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        
        
        
       
    }
}

struct FAQV_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
