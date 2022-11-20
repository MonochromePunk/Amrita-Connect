//
//  OddSemester.swift
//  Amrita Connect
//
//  Created by Siddharth on 17/09/22.
//

import SwiftUI
import SwiftSoup
struct table: Identifiable{
    var id = UUID()
    var title: String
    var header = [String]()
    var heading = [String]()
    var body : [[String]] = [[]]
    var subject = [String]()
    var row = 0
    var col = 0
}

struct OddSemester: View {
    @State var list = [table]()
    var body: some View {
        List {
            
            
            ForEach(list, id:\.self.id){ data in
                
                Section(header: Text(data.title)
                    .font(.title3)
                    .padding(.vertical)) {
                        
                        
                        ForEach(data.subject, id:\.self) { crs in
                            
                        
                            Section(header: Text(crs)
                            .font(.headline)) {
                                
                                
                               
                                    
                                    
                                    
                                    
                                    
                                    ForEach(1...data.col-1, id:\.self){ c in
                                        
                                        Button {
                                            //
                                        } label: {
                                            Text(data.header[c])
                                        }

                                        
                                        
                                }
                                
                                
                            }
                        }
                        
                        
                        
                        
                    }
            }
               
            
            
            
        }
        .cornerRadius(30)
        .padding(.top, 20)
       
        
        .task{
            await getDetails()
        }
        
            }
          
            
            
            
            
            
        
        
    
    
    func getDetails() async{
        guard let url = URL(string: "https://intranet.cb.amrita.edu/exam-cell/exam-schedule-OddSemester") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            do{
                let str = String(decoding: data, as: UTF8.self);
                let doc: Document = try SwiftSoup.parse(str);
                let elem : Element = try! doc.getElementsByClass("field--type-text-with-summary").first()!
                for i in try! elem.getElementsByTag("h3")
                {
                    list.append(table(title: try i.text()))
                    print(try i.text())
                }
                var count = 0
                for i in try! elem.getElementsByTag("tbody"){
                    for y in try! i.getElementsByTag("td"){
                        list[count].heading.append(try y.text())
                       
                    }
                    count+=1
                }
                
                count = 0
                
                for i in try! elem.getElementsByTag("thead")
                {
                    for y in try! i.getElementsByTag("th")
                    {
                        list[count].header.append(try y.text())
                    }
                    count+=1
                }
                
                count = 0
                for i in try! elem.getElementsByClass("table-responsive"){
                    
                    for j in try! i.getElementsByTag("tbody")
                    {
                        for k in try! j.getElementsByTag("tr")
                        {
                            var temp:Element = try! k.getElementsByTag("td").first()!
                            list[count].subject.append(try temp.text())
                        }
                        
                       
                    }
                    count+=1
                }
                
                
                count = 0
              
                for i in try! elem.getElementsByClass("table-responsive"){
                    var l = 0
                    for y in try! i.getElementsByTag("tr"){
                         var m = 0
                        var desc = [String]()
                        for z in try! y.getElementsByTag("td")
                        {
                            if(m == 0)
                            {
                                desc.append(try z.text())
                            }
                            else
                            {
                                let temp = try z.text()
                                if temp.contains("Download")
                                {
                                    desc.append(try z.getElementsByTag("a").attr("href"))
                                }
                                else
                                {
                                    desc.append("")
                                }
                            }
                            m+=1
                        }
                        list[count].col = m
                        list[count].body.append(desc)
                        l+=1
                    }
                    list[count].row = l
                    count+=1
                }
               var itr = 0
                while itr < list.count{
                    list[itr].body.remove(at: 0)
                    itr+=1
                }
                print(list[2].body)
                
               
            }
            catch
            {
                print("Error")
            }
        }
        catch
        {
            print("Error")
        }
    }
        
}

struct OddSemester_Previews: PreviewProvider {
    static var previews: some View {
        OddSemester()
    }
}
