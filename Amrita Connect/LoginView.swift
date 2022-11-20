//
//  LoginView.swift
//  Amrita Connect
//
//  Created by Siddharth on 14/06/22.
//

import SwiftUI
import SwiftSoup
struct LoginView: View {
    @State private var rollNumber:String = "cb.en.u4cse20069"
    @State private var password:String = "8Yebi6gi@"
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
        
        
        
        guard let url = URL(string: "https://cms.cb.amrita.edu/login") else {
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
                    key = try doc.getElementsByAttributeValue("name", "_token").attr("value")
                    
                   
                    
                    
                    
                    
                    var request2 = URLRequest(url: url)
                    request2.httpMethod = "POST"
                    
                    
                    let postString = "_token="+key+"&username="+rollNumber+"&password="+password;
                    
                    request2.httpBody = postString.data(using: String.Encoding.utf8);
                    
                    let task = URLSession.shared.dataTask(with: request2) { (data, response, error) in
                        
                        // Check for Error
                        if let error = error {
                            print("Error took place \(error)")
                            return
                        }
                        
                        // Convert HTTP Response Data to a String
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            
                            print(postString)
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
