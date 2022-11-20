//
//  LibraryView.swift
//  Amrita Connect
//
//  Created by Siddharth on 06/06/22.
//

import SwiftUI
import SwiftSoup
struct LibraryView: View {
   @State var search:String = ""
    
    
    @State var op = ""
    
    
    @State private var num = 0
@State private var choice = "Books (ASE)"
    @State private var key = 3
    @State private var user = ""
    private var db = ["Books (ASE)", "Books (ASB)", "CD (ASE)", "Dissertations", "Book Bank", "CD (ASB)", "Project (ASB)", "Articles Data"]
    var body: some View {
        
        
        
        NavigationView
        {
            
          
                
                
                ZStack
                    {
                        LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 148/255, blue: 130/255), Color(red: 125/255, green: 119/255, blue: 250/255)]),
                            startPoint: .topTrailing,
                                             endPoint: .leading)
                        .edgesIgnoringSafeArea(.top)
                        
                        
                        
                        
                        
                        
                        ScrollView
                        {
                            
                            VStack
                            {
                                
                                Text("Central Library")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                ZStack
                                {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .cornerRadius(30)
                                        .padding(.top,70)
                                        .edgesIgnoringSafeArea(.top)
                                VStack
                                    {
                                        
                                        
                                        Text(op)
                                        
                                        Text("OPAC Search")
                                            .font(.title)
                                            .fontWeight(.medium)
                                            .padding(.top, 95)
                                            .padding(.bottom, 30)
                                        
                                       
                                        Text("Select Database")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                        Picker(selection: $choice, label: Text("Database")) {
                                                       
                                            ForEach(db, id:\.self)
                                            { data in
                                                Text(data)
                                            }
                                        }
                                        .padding(.bottom, 25)
                                       
                                       
                                        
                                        
                                       
                                        
                                        Text("Search based on")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                        Picker(selection: $key, label: Text("Key")) {
                                                        Text("Resource Title").tag(1)
                                                        Text("Subject Name").tag(2)
                                                        Text("Resource Author Name").tag(4)
                                                        Text("Any Field").tag(3)

                                        }
                                        .padding(.bottom, 10)
                                        
                                        
                                        
                                        
                                        Text("Search Here")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                        TextField("Enter word (or) phrase", text: $search)
                                            .padding(.vertical,12)
                                            .padding(.horizontal,15)
                                            .border(Color(.gray))
                                            .padding(.horizontal,35)
                                            .padding(.bottom, 25)
                                            
                                        
                                        
                                        HStack(spacing:40)
                                        {
                                            Button {
                                               
                                                   searchLib()
                                                   
                                            } label: {
                                                Text("Search")
                                                    .foregroundColor(.white)
                                                    .padding(.vertical, 12)
                                                    .padding(.horizontal, 25)
                                                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 148/255, blue: 130/255), Color(red: 125/255, green: 119/255, blue: 250/255)]),
                                                                               startPoint: .topTrailing,
                                                                                                endPoint: .leading))
                                                    .cornerRadius(12)
                                                   
                                            }
                                            
                                            
                                            Button {
                                                search = ""
                                                choice = ""
                                                key = 1
                                            } label: {
                                                Text("Reset")
                                                
                                                    .foregroundColor(.black)
                                                    .padding(.vertical, 12)
                                                    .padding(.horizontal, 25)
                                                
                                                    
                                                
                                            }

                                            
                                        }
                                        .padding(.top,20)
                                        .padding(.bottom,100)
                                           
                                            

                                        
                                        
                                        
                                        
                                        
                                           
                                            
                                       
                                    }
                                   
                                }
                               
                                
                                
                                
                              
                                   
                            }
                            
                            
                        }
                        
                        
                        
                        
                    }
                    .task {
                        await getUser()
                    }
                   
                
                
            }
            
               
      
           
        }
    
    
    func getUser() async
    {
        guard let url = URL(string: "http://172.17.9.22/cgi-bin/lsbrows1.cgi?Database_no_opt=++++") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            do{
                let str = String(decoding: data, as: UTF8.self);
                let doc: Document = try SwiftSoup.parse(str);
                user = try doc.getElementsByAttributeValue("name", "user_name").attr("value")
                
                
    }
            catch{
                print("Error")
            }
        }
        catch
        {
            print("Error")
        }
    }
    
    
    func searchLib()
    {
        if(choice == "Books (ASE)")
        {
            num = 0
        }
        else if(choice == "Books (ASB)")
        {
            num = 1
        }
        else if(choice == "CD (ASE)")
        {
            num = 2
        }
        else if(choice == "Dissertations")
        {
            num = 3
        }
        else if(choice == "Book Bank")
        {
            num = 4
        }
        else if(choice == "CD (ASB)")
        {
            num = 5
        }
        else if(choice == "Project (ASB)")
        {
            num = 6
        }
        else if(choice == "Articles Data")
        {
            num = 7
        }
        
        
        
        
        
        guard let url = URL(string: "http://172.17.9.22/cgi-bin/lsbrows6N.cgi") else {
            print("Invalid URL")
            return
        }
        
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
        
            let postString = "user_name="+user+"&Docu_type=0&FIELD=3&T=fundamentals&OPTION=2&ch_period=0&TR=";
        
        op = postString
        
            request.httpBody = postString.data(using: String.Encoding.utf8);

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    
                    
                   
                   
                    
                    do
                    {
                        let str = String(decoding: data, as: UTF8.self);
                        let doc: Document = try SwiftSoup.parse(str);
                       print("\n\n\n\n\n")
                        print(str)
                        
                       
                       
                    }
                    catch
                    {
                        print("Error")
                    }
                }
                
                
                
              
            
                  
                  
            
        }.resume()
        
        
        
        
        
    }
    
        
    
    }


struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
