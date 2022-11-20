//
//  LibraryView.swift
//  Amrita Connect
//
//  Created by Siddharth on 06/06/22.
//

import SwiftUI
import SwiftSoup
import WebKit

struct Result: Codable {
    var name: String
}

struct TimeTableView: View {
   @State var search:String
@State private var choice = 1
    @State private var key = 1
    
    @State var crskey = ""
    
    @State private var results = [Result]()
    @State private var list = ["Year"]
    
    @State var final:String=""
    @State var selected = "Year"
    @State var course = "Course"
    @State var courselist = ["Course"]
    @State var courseKey = ["Course"]
  
    
    @State var branch = "Branch"
    @State var branchlist = ["Branch"]
    @State var disabled1 = true
    @State var disabled2 = true
    @State var disabled3 = true
    @State var disablecrs = true
    
    @State var disabled4 = true
    
    @State var semester = "Semester"
    @State var semesterlist = ["Semester"]
    
    @State var section = "Section"
    @State var sectionlist = ["Section"]
    
    @State var batch = "Batch"
    @State var batchlist = ["Batch"]
    
    @State var showingAlert = false

    
   
    
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
                                
                                Text("Academic Time Table")
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
                                        Text("Search")
                                            .font(.title)
                                            .fontWeight(.medium)
                                            .padding(.top, 95)
                                            .padding(.bottom, 30)
                                        
                                       
                                        Text("Select Year")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                        
                                       
                                        Picker("Year", selection: $selected) {
                                            ForEach(list, id: \.self) {
                                                            Text($0)
                                                        }
                                            .onChange(of: selected) { newValue in
                                            enableCrs()
                                            }
                                    
                                    
                                    }
                                       
                                       
                                
                                       
                                        
                                        
                                       
                                        
                                        Text("Search Course")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                        Picker("Course", selection: $course) {
                                                        ForEach(courselist, id: \.self) {
                                                            Text($0)
                                                        }
                                                        .onChange(of: course) { newValue in
                                                        APICourse()
                                                        }
                                    
                                    
                                    }
                                        .padding(.bottom, 10)
                                        .disabled(disablecrs)
                                        
                                        
                                        
                                        Text("Search Branch")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                        
                                        Picker("Branch", selection: $branch) {
                                                        ForEach(branchlist, id: \.self) {
                                                            Text($0)
                                                        }
                                                        .onChange(of: branch) { newValue in
                                                        APIBranch()
                                                        }
                                    
                                    
                                    }
                                        .padding(.bottom, 10)
                                        .disabled(disabled1)
                                        
                                        
                                        
                                        VStack
                                        {
                                            Text("Search Semester")
                                                .font(.title3)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.horizontal,35)
                                            
                                            Picker("Semester", selection: $semester) {
                                                            ForEach(semesterlist, id: \.self) {
                                                                Text($0)
                                                            }
                                                
                                                            .onChange(of: semester) { newValue in
                                                            APISemester()
                                                            }
                                        
                                        
                                        }
                                            .padding(.bottom, 10)
                                            .disabled(disabled2)
                                            
                                            
                                            
                                            
                                            Text("Search Batch")
                                                .font(.title3)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.horizontal,35)
                                            
                                            Picker("Batch", selection: $batch) {
                                                            ForEach(batchlist, id: \.self) {
                                                                Text($0)
                                                            } .onChange(of: batch) { newValue in
                                                                EnableButton()
                                                                }
                                                
                                        
                                        
                                        }
                                            .padding(.bottom, 10)
                                            .disabled(disabled3)
                                            
                                            
                                            
                                            
                                            
                                            
                                        }
                                        
                                        
                                        
                                      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                      
                                        
                                        
                                        
                                     
                                            
                                        
                                        
                                        HStack(spacing:40)
                                        {
                                            Button {
                                               
                                                   GetDetails()
                                                   
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
                                                
                                                
                                                
                                                course = "Course"
                                                selected = "Year"
                                                disablecrs = true
                                                    disabled4 = true
                                                    disabled1 = true
                                                    disabled2 = true
                                                    disabled3 = true
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
        .alert("Timetable not available", isPresented: $showingAlert) {
                   Button("OK", role: .cancel) { }
               }
       
            
               
      
           
        }
       
    
    
    
    func loadData() async {
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
                
                
                let eleme : Element = try doc.getElementById("drop_1")!
               courselist = []
                courseKey = []
                for i in try eleme.getElementsByTag("option")
                {
                    courselist.append(try i.text())
                    courseKey.append(try i.attr("value"))
                }
                
                
                
                
                
                
                
               
                            }
            catch{
                print("Error")
            }
        
        
           
        } catch {
            print("Invalid data")
        }
    }
    
    
    
    
    func APICourse() -> Int
    {
        
        
        guard let pos = courselist.firstIndex(of: course) else { return 0 }
        crskey = courseKey[pos]
        print("\n\n\n")
        print(crskey)
        guard let url = URL(string: "https://intranet.cb.amrita.edu/TimeTable/funcTimeTable.php?func=drop_1&drop_var="+crskey) else {
            print("Invalid URL")
            return 0
        }
        
            let request = URLRequest(url: url)

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    
                    
                   
                   
                    
                    do
                    {
                        branchlist = []
                        let str = String(decoding: data, as: UTF8.self);
                        let doc: Document = try SwiftSoup.parse(str);
                        let eleme : Element = try doc.getElementById("drop_2")!
                        for i in try eleme.getElementsByTag("option")
                        {
                            branchlist.append(try i.text())
                        }
                      
                        disabled1 = false
                    }
                    catch
                    {
                        print("Error")
                    }
                }
                
                
                
              
            
                  
                  
            
        }.resume()
        return 1
    }
        
    
    
    func APIBranch()
    {
        guard let url = URL(string: "https://intranet.cb.amrita.edu/TimeTable/funcTimeTable.php?func=drop_2&drop_var="+branch) else {
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
                        let eleme : Element = try doc.getElementById("drop_3")!
                       semesterlist = []
                        for i in try eleme.getElementsByTag("option")
                        {
                            semesterlist.append(try i.text())
                        }
                       
                      
                        
                       
                        disabled2 = false
                    }
                    catch
                    {
                        print("Error")
                    }
                }
                
                
                
              
            
                  
                  
            
        }.resume()
    }
    func enableCrs()
    {
        disablecrs = false
    }
    
    
    
    
    func APISemester()
    {
        guard let url = URL(string: "https://intranet.cb.amrita.edu/TimeTable/funcTimeTable.php?func=drop_3&drop_var="+semester) else {
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
                        let eleme : Element = try doc.getElementById("drop_4")!
                       batchlist = []
                        for i in try eleme.getElementsByTag("option")
                        {
                            batchlist.append(try i.text())
                        }
                       
                      
                        
                       
                        disabled3 = false
                    }
                    catch
                    {
                        print("Error")
                    }
                }
                
                
                
              
            
                  
                  
            
        }.resume()
    }
    
    
    func EnableButton()
    {
        disabled4 = false;
        
        
    }
    
    func GetDetails()
    {
        let fyear = selected.replacingOccurrences(of: "-", with: "_", options: .literal, range: nil)
        
        
        
        
        
        
        guard let url = URL(string: "https://intranet.cb.amrita.edu/TimeTable/PDF/"+fyear+"/"+crskey+"/"+branch+"/"+crskey+branch+batch+semester+".pdf") else {
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
                        let elem = try doc.getElementsByTag("body").text()
                        print("\n\n\n")
                        print(elem)
                        if(elem == "File not found.")
                        {
                            showingAlert = true
                        }
                        else
                        {
                            
                            if let url2 = URL(string: "https://intranet.cb.amrita.edu/TimeTable/PDF/"+fyear+"/"+crskey+"/"+branch+"/"+crskey+branch+batch+semester+".pdf") {
                                UIApplication.shared.open(url2)
                            }
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




struct TimeTableView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTableView(search: "")
    }
}
