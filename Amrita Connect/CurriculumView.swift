//
//  LibraryView.swift
//  Amrita Connect
//
//  Created by Siddharth on 06/06/22.
//

import SwiftUI
import SwiftSoup


struct Details {
    let id: UUID
    let heading: String
    var course: [String]
    var link: [String]
}




struct CurriculumView: View {
    
    @State var openlink = ""
    @State var searchc = "Please select program"
    
    @State var datas = [
        Details(id: UUID(), heading: "No Course Available", course: ["Please select program"], link: [])
    ]
   
    
    
    let program = ["Select Program","Undergraduate Program","Postgraduate Program"]
    @State var selectedpgm = "Select Program"
    @State var selected = "No Course Available"
   
    
    var containerWidth:CGFloat = UIScreen.main.bounds.width - 32.0
    
    var body: some View {
        
        
        
        NavigationView
        {
            
           
          
                
                
                ZStack
                    {
                        LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 148/255, blue: 130/255), Color(red: 125/255, green: 119/255, blue: 250/255)]),
                            startPoint: .topTrailing,
                                             endPoint: .leading)
                        .edgesIgnoringSafeArea(.top)
                        
                        
                        
                        
                        
                    
                            
                            VStack
                            {
                                
                              
                                Text("Curriculum")
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
                                        
                                        
                                        Text("Curriculum Search")
                                            .font(.title)
                                            .fontWeight(.medium)
                                            .padding(.top, 95)
                                            .padding(.bottom, 30)
                                        
                                       
                                        Text("Select Program")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                        
                                        Picker("Program",selection: $selectedpgm)
                                        {
                                            ForEach(program, id: \.self){
                                                x in
                                                Text(x)
                                            }
                                        }
                                        .onChange(of: selectedpgm) { newValue in
                                            loadData()
                                        }
                                        
                                        
                                        Text("Select Course")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                           
                                        
                                       
                                        
                                        
                                        List {
                                            
                                            
                                            ForEach(datas, id:\.self.id){
                                                x in
                                           
                                            
                                            
                                         
                                            
                                                Section(header: Text(x.heading)
                                                .font(.title3)
                                                .padding(.vertical)) {
                                                      
                                                      
                                                            
                                                            
                                                    ForEach(x.course, id:\.self){
                                                        y in
                                                        
                                                        Button {
                                                            searchc = y
                                                        } label: {
                                                           Text(y)
                                                        }

                                                        
                                                    }
                                                    .onChange(of: searchc) { newdata in
                                                        ShowData()
                                                    }
                                                           
                                                          
                                                        
                                                        
                                                        
                                                   
                                                        
                                                    }
                                            
                                            
                                            
                                            
                                            
                                            
                                            }
                                            
                                            
                                            
                                        }
                                     
                                        .padding(.top, 20)
                                            
                                            
                                       
                                        
                                        
                                        
                                    
                                    
                                        
                                        
                                     
                                        
                                        
                                       
               
                                    }
                                }
                                
                            }
                            
                    
                        
                    }
        }
        
        
    }
    
    func loadData()
    {
        if selectedpgm == "Select Program"
        {
            datas = [
            Details(id: UUID(), heading: "No Course Available", course: ["Please select program"], link: [])
            ]
        }
        else
        {
            var searchdata = ""
            
            if(selectedpgm == "Undergraduate Program")
            {
                searchdata = "undergraduate"
            }
            else
            {
                searchdata = "postgraduate"
            }
            datas = [
            Details(id: UUID(), heading: "", course: [], link: [])
            ]
            
            guard let url = URL(string: "https://intranet.cb.amrita.edu/academics/"+searchdata) else {
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
                            for x in  try doc.getElementsByClass("nav-tabs").select("li")
                            {
                                datas.append(Details(id: UUID(), heading: try x.text(), course: [], link: []))
                               
                            }
                            datas.remove(at: 0)
                           
                            var position = 0
                            for x in try doc.getElementsByClass("tab-pane")
                            {
                                for y in try x.select("li")
                                {
                                    datas[position].course.append(try y.text())
                                    datas[position].link.append(try y.select("a").attr("href"))
                                  
                                    
                                }
                                position+=1
                                
                            }
                           
                          
                            
                           
                          
                        }
                        catch
                        {
                            print("Error")
                        }
                    }
                    
                    
                    
                  
                
                      
                      
                
            }.resume()
            
            
            
            
        }
        
       
        
        
        
        
        
    }
    
    func ShowData() -> Int
    {
        
        for x in datas
        {
            if x.course.contains(searchc)
            {
                guard let pos = x.course.firstIndex(of: searchc) else { return 0 }
               openlink = x.link[pos]
                if  openlink.contains("intranet")
                {
                   
                }
                else
                {
                    openlink = "https://intranet.cb.amrita.edu" + openlink
                }
                print("\n\n\n\n")
                print(openlink)
                if let url2 = URL(string: openlink) {
                    UIApplication.shared.open(url2)
                }
                
            }
        }
        return 0
        
    }
   
    
}


struct CurricukumView_Previews: PreviewProvider {
    static var previews: some View {
        CurriculumView()
    }
}
