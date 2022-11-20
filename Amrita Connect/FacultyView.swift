//
//  LibraryView.swift
//  Amrita Connect
//
//  Created by Siddharth on 06/06/22.
//

import SwiftUI

import SwiftSoup



struct FacultyView: View {

   @State var search:String
@State private var choice = 7
    @State private var key = 1
    var placeholder = "Select Client"
    @State var dropDownList = ["No Recommendation"]
    @State var disabled1 = true
    @State var disabled2 = true
    @State var disabled3 = true
    @State var disabled4 = true
    @State private var list = ["Year"]
    var containerWidth:CGFloat = UIScreen.main.bounds.width - 32.0
    
    @State var final:String=""
    @State var selected = "Year"
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
                                
                                Text("Faculty Time Table")
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
                                        Text("Faculty Search")
                                            .font(.title)
                                            .fontWeight(.medium)
                                            .padding(.top, 95)
                                            .padding(.bottom, 30)
                                        
                                       
                                        Text("Faculty Name")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                       
                                            TextField("Enter faculty name", text: $search)
                                                .padding(.vertical,12)
                                                .padding(.horizontal,15)
                                                .border(Color(.gray))
                                                .padding(.horizontal,35)
                                                .padding(.bottom, 25)
                                                .onChange(of: search) { data in
                                                    changeList()
                                                }
                                        
                                        Text("Recommendations")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                        
                                        
                                        ForEach(dropDownList, id: \.self) {elem in
                                            Button {
                                                search = elem
                                            } label: {
                                                Text(elem)
                                                   
                                                    .frame(width: containerWidth * 0.80)
                                                    
                                                    .padding(.vertical, 10)
                                                    .padding(.horizontal,10)
                                                   
                                                   
                                                   
                                                   
                                                    .background(Color(red: 234/255, green: 234/255, blue: 234/255))
                                                    .foregroundColor(.black)
                                                    .cornerRadius(15)
                                                    
                                                
                                                   
                                                    
                                                   
                                                
                                                   
                                                   
                                            }
                                            
                                            
                                            

                                        }
                                        .disabled(disabled1)
                                        
                                        
                                      
                                        

                                           
                                                
                                            
                                            
                                        
                                       
                                      
                                       
                                        
                                        
                                       
                                        
                                        Text("Academic Year")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                            .padding(.top, 20)
                                        
                                         Picker("Year", selection: $selected) {
                                             ForEach(list, id: \.self) {
                                                             Text($0)
                                                         }
                                         
                                        .padding(.bottom, 10)
                                         }
                                        .disabled(disabled2)
                                        .onChange(of: selected) { newValue in
                                            enableSem()
                                        }
                                        
                                        
                                        
                                        
                                        Text("Semester")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                        Picker(selection: $key, label: Text("Key")) {
                                                        Text("Even Semester").tag(1)
                                            Text("Odd Semester").tag(2)
                                           

                                        }
                                        .padding(.bottom, 10)
                                        .disabled(disabled3)
                                            
                                        
                                        
                                        HStack(spacing:40)
                                        {
                                            
                                            Button {
                                                
                                                getData()
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
                                            .disabled(disabled4)

                                         
                                                
                                                   
                                            
                                            
                                            Button {
                                                search = ""
                                                choice = 1
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
                   
                
                
            }
        .task {
            await loadData()
        }
            
       
      
           
        }
    
    func loadData() async{
        guard let url = URL(string: "https://intranet.cb.amrita.edu/TimeTable/") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            do{
                let str = String(decoding: data, as: UTF8.self);
                let doc: Document = try SwiftSoup.parse(str);
            let elem: Element = try doc.getElementById("year")!
                let year = try elem.text()
                list = year.components(separatedBy: " ")
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
    
    func changeList()
    {
        var newsearch = search.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        guard let url = URL(string: "https://intranet.cb.amrita.edu/TimeTable/Faculty/get_staff_list.php?q="+newsearch) else {
            print("Invalid URL")
            return
        }
        
            let request = URLRequest(url: url)

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    
                    
                    let str = String(decoding: data, as: UTF8.self);
                    dropDownList = str.components(separatedBy: "\n")
                    dropDownList.removeLast()
                    if dropDownList == []
                    {
                        dropDownList = ["No Recommendation"]
                        disabled1 = true
                        if(search != "")
                        {
                            disabled2 = false
                        }
                        if(search == "")
                        {
                            disabled2 = true
                        }
                        
                    }
                    else
                    {
                        disabled1 = false
                        
                    }
                    
                }
                
            
                  
                  
            
        }.resume()
    }
    
    func enableSem()
    {
        disabled3 = false
        disabled4 = false
    }
    
    func getData()
    {
       // year=2022_23&sem=O&faculty=Abirami+K+-+CSE&Nyear=2022_23&Nsem=O&NAMEshwbutton=Show+Details
        
        
        
        
        
    }
        
    
    }


struct FacultyView_Previews: PreviewProvider {
    static var previews: some View {
        FacultyView(search: "")
    }
}
