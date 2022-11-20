//
//  LoginView.swift
//  Amrita Connect
//
//  Created by Siddharth on 14/06/22.
//

import SwiftUI
import SwiftSoup
struct AUMSView: View {
    @State private var rollNumber:String = "cb.en.u4cse20069"
    @State private var password:String = "9Yebi6gi@"
    @State private var login = false
    @State private var alertshow = false
    @State private var loading = false
    @State private var key = ""
    @State private var name = ""
    var body: some View {
        
        NavigationView
        {
            
            
            
            
            
            
            VStack
            {
                
                
                
                
                
                
                Image("amritadraw")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                
                Text("Login")
                    .font(.title)
                    .padding(.top, 50)
                
                
                
                Form {
                    TextField(text: $rollNumber, prompt: Text("Username")) {
                        Text("Username")
                    }
                    SecureField(text: $password, prompt: Text("Password")) {
                        Text("Password")
                    }
                    
                    
                    VStack{
                        
                        Spacer()
                        
                        Button {
                            validateLogin()
                        } label: {
                            Text("LOGIN")
                                .foregroundColor(Color(red: 168/255, green: 20/255, blue: 60/255))
                                .font(.headline)
                        }
                        NavigationLink(destination: Tab() .navigationBarBackButtonHidden(true)
                                       , isActive: $login){
                            EmptyView()
                            
                        }
                                       .hidden()
                        
                        
                    }
                    
                    
                    
                }
                
                
                
                
                if(loading){
                    ProgressView()
                }
                
                
                
                
                
                HStack
                {
                    Image(systemName: "c.circle")
                    Text("Amrita Vishwa Vidyapeetham")
                }
                .padding(.top,20)
                
                
                
                
            }
        }
        .alert("Invalid Credentials", isPresented: $alertshow) {
            Button("OK", role: .cancel) { alertshow = false}
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    func validateLogin()
    {
        
        login = false
        loading = true
        
        
        
        guard let url = URL(string: "https://aumscb.amrita.edu/aums/Jsp/Common/index.jsp") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                
                
                
                
                
                do
                {
                    let str = String(decoding: data, as: UTF8.self);
                    let doc: Document = try SwiftSoup.parse(str);
                    key = try doc.getElementsByAttributeValue("name", "execution").attr("value")
                    
                   
                    //print(key)
                    
                    
                    
                    var request2 = URLRequest(url: url)
                    request2.httpMethod = "POST"
                    
                    
                    
                    let json : [String : Any] =
                    [
                        "username" : rollNumber,
                        "password" : password,
                        "execution" : key,
                        "_eventId" : "submit",
                        "submit" : "LOGIN"
                        
                    ]
                    
                  
                    
                    let jsonData = try? JSONSerialization.data(withJSONObject: json)
                    
                    request2.httpBody = jsonData
                    
                    let task = URLSession.shared.dataTask(with: request2) { (data, response, error) in
                        
                        // Check for Error
                        if let error = error {
                            print("Error took place \(error)")
                            return
                        }
                        
                        // Convert HTTP Response Data to a String
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            
                           
                           print("Response data string:\n \(dataString)")
                        }
                    }
                    task.resume()
                    
                    
                    
                    
                    
                    
                    
                }
                catch
                {
                    print("Error")
                }
            }
            
            
        }.resume()
        
        
        
       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        if(login == true)
        {
            loading = false
        }
        
        if(login == false)
        {
            alertshow = true
            loading = false
        }
    }
    
    
}

struct AUMSView_Previews: PreviewProvider {
    static var previews: some View {
        AUMSView()
    }
}
