//
//  TimingView.swift
//  Amrita Connect
//
//  Created by Siddharth on 08/06/22.
//

import SwiftUI
var timeArrayM = ["09:20 AM", "09:40 AM", "10:10 AM", "10:30 AM", "11:10 AM", "11:20 AM"]

var timeArrayE = ["12:00 PM", "12:20 PM", "01:00 PM", "01:10 PM", "01:50 PM", "02:10 PM", "02:40 PM", "03:00 PM", "03:30 PM"]




func getCurrentTime() -> String {
    let formatter = DateFormatter()
    formatter.timeStyle = .short
    let current = formatter.string(from: Date())
    let index = current.index(current.startIndex, offsetBy: 5)
    let index2 = current.index(current.startIndex, offsetBy: 6)
    let check = String(current[index])
    let check2 = String(current[index2])
    var newtime = ""
    

   
    if(check == "A" || check2 == "A")
        
    {
        
      
       if((current >= "12:00 AM" && current <= "12:59 AM") || (current >= "1:00 AM" && current <= "9:20 AM"))
        {
           newtime = "9:20 AM"
       }
        
        
        else if(current <= "9:40 AM")
        {
            newtime = "9:40 AM"
        }
        
        
        else if(current <= "10:10 AM")
        {
            newtime = "10:10 AM"
        }
        
        else if(current <= "10:30 AM")
        {
            newtime = "10:30 AM"
        }
        
        else if(current <= "11:10 AM")
        {
            newtime = "11:10 AM"
        }
        
        else if(current <= "11:20 AM")
        {
            newtime = "11:20 AM"
        }
        else
        {
            newtime = "12:00 PM"
        }
        
        
    }
    else
    {
        
        
        if(current <= "12:20 PM")
        {
            newtime = "12:20 PM"
        }
        else if(current <= "1:00 PM")
        {
            newtime = "1:00 PM"
        }
        else if(current <= "1:10 PM")
        {
            newtime = "1:10 PM"
        }
        else if(current <= "1:50 PM")
        {
            newtime = "1:50 PM"
        }
        else if(current <= "2:10 PM")
        {
            newtime = "2:10 PM"
        }
        else if(current <= "2:40 PM")
        {
            newtime = "2:40 PM"
        }
        else if(current <= "3:00 PM")
        {
            newtime = "3:00 PM"
        }
        else if(current <= "3:30 PM")
        {
            newtime = "3:30 PM"
        }
        else
        {
            newtime = "NA"
        }
    }
   
    return newtime
   
}

struct TimingView: View {
  
    var body: some View {
        
       
            NavigationView
            {
                
              
                VStack
                {
                    
                    
                    
                  
                    ZStack
                    {
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 148/255, blue: 130/255), Color(red: 125/255, green: 119/255, blue: 250/255)]),
                                                 startPoint: .topTrailing,
                                                                  endPoint: .bottomLeading))
                            .frame(width: 345, height: 215, alignment: .center)
                            .cornerRadius(25)
                            .shadow(color: .black, radius: 7, x: 0, y: 0)
                            .padding(.top, 10)
                        
                        
                        VStack
                       {
                           
                            
                            HStack
                            { Spacer()
                                Text("Bus Pass")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 50)
                                    .padding(.trailing, 40)
                                  
                               Spacer()
                                    
                                Image(systemName: "bus.fill")
                                    .scaleEffect(2)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 30)
                                    .padding(.leading, 80)
                                Spacer()
                                   
                            }
                            
                            
                            
                            
                            HStack {
                                VStack(spacing:10)
                                {
                                    
                                    
                                    HStack
                                    {
                                        Text("From:")
                                            .font(.headline)
                                          
                                            .padding(.leading, 30)
                                        Text("AB1 / AB3")
                                            .frame(maxWidth: 345, alignment: .leading)
                                            .padding(.leading, 0)
                                    }
                                    
                                    HStack
                                    {
                                        Text("To:")
                                            .font(.headline)
                                            .padding(.leading, 30)
                                        Text("AB3 / AB1")
                                            .frame(maxWidth: 345, alignment: .leading)
                                            .padding(.leading, 0)
                                    }
                                }
                            .foregroundColor(.white)
                                
                                  
                                let curr = getCurrentTime()
                                 
                                Text("Time : \(curr)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.trailing, 30)
                            }
                            .frame(maxWidth: 345, alignment: .center)
                            
                          
                            
                        }
                        
                    }
                    
                   
                    
                    List {
                        
                        
                     
                        
                        Section(header: Text("Bus from Academic Block 1")
                            .font(.title3)
                            .padding(.vertical)) {
                                  
                                    
                                    Section(header: Text("Morning")
                                        .font(.headline)) {
                                        
                                        
                                        Text("9:20 AM")
                                        Text("9:40 AM")
                                        Text("10:10 AM")
                                        Text("10:30 AM")
                                        Text("11:10 AM")
                                        Text("11:20 AM")
                                       
                                      
                                    }
                                    
                                    
                                    Section(header: Text("Evening")
                                        .font(.headline)) {
                                        
                                        
                                        Text("12:00 PM")
                                        Text("12:20 PM")
                                        Text("1:00 PM")
                                        Text("1:10 PM")
                                        Text("1:50 PM")
                                        Text("2:10 PM")
                                        Text("2:40 PM")
                                        Text("3:00 PM")
                                        Text("3:30 PM")
                                      
                                    }
                                    
                                }
                        
                        
                        
                        
                        
                        
                        Section(header: Text("Bus from Academic Block 3")
                            .font(.title3)
                            .padding(.vertical)) {
                                  
                                    
                                    Section(header: Text("Morning")
                                        .font(.headline)) {
                                        
                                        
                                        
                                        Text("9:20 AM")
                                        Text("9:40 AM")
                                        Text("10:10 AM")
                                        Text("10:30 AM")
                                        Text("11:10 AM")
                                        Text("11:20 AM")
                                       
                                      
                                    }
                                    
                                    
                                    Section(header: Text("Evening")
                                        .font(.headline)) {
                                        
                                        
                                        Text("12:00 PM")
                                        Text("12:20 PM")
                                        Text("1:00 PM")
                                        Text("1:10 PM")
                                        Text("1:50 PM")
                                        Text("2:10 PM")
                                        Text("2:40 PM")
                                        Text("3:00 PM")
                                        Text("3:30 PM")
                                      
                                    }
                                    
                                }
                           
                        
                        
                        
                    }
                    .cornerRadius(30)
                    .padding(.top, 20)
                   
                    
                    
                    
                }
                .navigationTitle("Bus Timings")
      
            }
          
        
        
        
      
       
    }
}

struct TimingView_Previews: PreviewProvider {
    static var previews: some View {
        TimingView()
    }
}
