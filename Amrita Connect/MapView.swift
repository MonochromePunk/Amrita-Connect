//
//  LibraryView.swift
//  Amrita Connect
//
//  Created by Siddharth on 06/06/22.
//

import SwiftUI

struct MapView: View {
    @State private var disabled1 = true
    @State private var disabled2 = true
    @State private var source = "Current Location"
    @State private var destination = "Current Location"
    @State private var filter = "Select Filter"
    private var srs = ["Current Location"]
    private var fltr = ["Select Filter", "Academic Block", "Canteen", "Sports", "Boys Hostel", "Girls Hostel","Auditorium", "Other Destinations"]
    @State private var dstn = ["Select Destination"]
    @State private var latitude = 0.00
    @State private var longtitude = 0.00
    @State private var arrayno = 0;
    
    private var x1 = [10.900600203524819,10.90361666013281,10.90639985540134, 10.905328901573693, 10.904395924104087]
    private var y1 = [ 76.90279860739798,76.89835684363251, 76.89819508736286, 76.90199510840986, 76.90189773463962]
    
    private var x2 = [10.900186371110113, 10.904593209741485, 10.904934562741817]
    private var y2 = [76.90391529168454, 76.90218695347495, 76.89811706680821]
    
    private var x3 = [10.90165656303057, 10.899845628968915, 10.901308095797676, 10.901718919649326, 10.901754005079036, 10.90171238383668, 10.906363546493692, 10.90454264124681, 10.901665527004184, 10.902371806168668, 10.90153541200899, 10.90143017446553]
    private var y3 = [76.89522046000252, 76.90207328389862, 76.90475823597608, 76.90462411932408, 76.90294657494746, 76.89551999261896, 76.89939307461886, 76.90190369220161, 76.89517084169974, 76.90097031003857, 76.8949034681617, 76.89461478519563]
    
    private var x4 = [10.901068267347009, 10.90219323526979, 10.901861835674236, 10.902660832867578, 10.901056718567911, 10.902258766442193, 10.90446859976901]
    private var y4 = [76.90459226383155, 76.89635371186247, 76.89622176007899, 76.90408403188536, 76.90447759264181, 76.8972074899481, 76.90050982415052]
    
    private var x5 = [10.900557597892952, 10.902385931750908, 10.906701475321748]
    private var y5 = [76.90129527871939, 76.89971316089355, 76.89943597686353]
    
    private var x6 = [10.903924166175674,10.901774775107748, 10.901889345474743, 10.90180111322188, 10.9032873133016, 10.902095304020609, 10.899861471835056, 10.89864070407936, 10.898411377170397]
    private var y6 = [ 76.89820408426466, 76.90184429822554, 76.90192476489743, 76.90188788413944, 76.9022034784414, 76.90102590032393, 76.90358513876104, 76.89578166938567, 76.896369689755]
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
                                
                                Text("Amrita Navigator")
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
                                        Text("Search Location")
                                            .font(.title)
                                            .fontWeight(.medium)
                                            .padding(.top, 95)
                                            .padding(.bottom, 30)
                                        
                                       
                                        
                                      
                                        
                                        
                                        Text("Select Source")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                        Picker(selection: $source, label: Text("Source")) {
                                            
                                            ForEach(srs, id:\.self){
                                                data in
                                                Text(data)
                                            }
                                           
                                                      
                                                        
                                        }
                                        .padding(.bottom, 25)
                                       
                                       
                                        
                                        
                                       
                                        
                                        Text("Select Filter")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                        Picker(selection: $filter, label: Text("Destination")) {
                                                      
                                            ForEach(fltr, id:\.self){
                                                data in
                                                Text(data)
                                            }

                                        }
                                        .padding(.bottom, 25)
                                        .onChange(of: filter) { newValue in
                                            showDestination()
                                        }
                                        
                                        
                                        
                                        Text("Select Destination")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal,35)
                                        Picker(selection: $destination, label: Text("Destination")) {
                                                      
                                            ForEach(dstn, id:\.self){
                                                data in
                                                Text(data)
                                            }

                                        }
                                        .padding(.bottom, 10)
                                        .disabled(disabled1)
                                        
                                        
                                        
                                        
                                    
                                        
                                        HStack(spacing:40)
                                        {
                                            Button {
                                               
                                                   openMap()
                                                   
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
                                            .disabled(disabled2)
                                            
                                            
                                            Button {
                                                
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
            
               
      
           
        }
    func showDestination()
    {
        if filter == "Select Filter"
        {
            disabled1 = true
            disabled2 = true
            dstn = ["Select Destination"]
            arrayno = 0
        }
        else
        {
            disabled1 = false
            disabled2 = false
            if filter == "Academic Block"
            {
                dstn = ["Academic Block 1", "Academic Block 2", "Academic Block 3", "CIR Block", "ASB Block"]
                arrayno = 1
            }
            
            if filter == "Canteen"
            {
                dstn = ["Main Canteen", "ASB Canteen", "IT Canteen"]
                arrayno = 2
            }
            
            if filter == "Sports"
            {
                dstn = ["Indoor Badminton Court", "Tennis Court", "Basketball Main Court", "Volleyball Court", "Main Ground", "Indoor Badminton Court", "Swimming Pool", "Kalari Temple", "Amrita University Gym", "Gargi Bhawan Gym", "Boys Gym", "Cricket/Football Ground"]
                arrayno = 3
            }
            if filter == "Boys Hostel"
            {
                dstn = ["Yagnavalkya Bhavanam", "Agasthya Bhavanam", "Vasishta Bhavanam", "Nachiketas Bhavanam", "Sri Vyasa Maharishi Bhavanam", "Gauthama Bhavanam", "Kapila Bhavanam"]
                arrayno = 4
            }
            if filter == "Girls Hostel"
            {
                dstn = ["Mythreyi Bhavanam", "Gargi Bhavanam", "Adithi Bhavanam"]
                arrayno = 5
            }
            if filter == "Auditorium"
            {
                dstn = ["Amriteshwari Hall", "Sudhamani Hall", "New Auditorium"]
                arrayno = 6
            }
            if filter == "Other Destinations"
            {
                dstn = ["Dhanalakshmi Bank ATM", "General Stores", "Pharmacy", "Naturals Spa N Unisex Saloon", "Yashodha Vanam", "Amrita Ashramam", "Birthday Celebrations", "Ettimadai Railway Station", "Ettimadai A3 Bus Stop"]
                arrayno = 7
            }
            
        }
    }
    
    func openMap()
    {
       if(arrayno == 0)
        {
           latitude = 0
           longtitude = 0
       }
        
        if(arrayno == 1)
         {
            
            latitude = x1[dstn.firstIndex(of: destination) ?? Array<String>.Index(0)]
            longtitude = y1[dstn.firstIndex(of: destination) ?? Array<String>.Index(0)]
        }
        
        if(arrayno == 2)
         {
            
            latitude = x2[dstn.firstIndex(of: destination) ?? Array<String>.Index(0)]
            longtitude = y2[dstn.firstIndex(of: destination) ?? Array<String>.Index(0)]
        }
        if(arrayno == 3)
         {
            
            latitude = x3[dstn.firstIndex(of: destination) ?? Array<String>.Index(0)]
            longtitude = y3[dstn.firstIndex(of: destination) ?? Array<String>.Index(0)]
        }
        if(arrayno == 4)
         {
            
            latitude = x4[dstn.firstIndex(of: destination) ?? Array<String>.Index(0)]
            longtitude = y4[dstn.firstIndex(of: destination) ?? Array<String>.Index(0)]
        }
        if(arrayno == 5)
         {
            
            latitude = x5[dstn.firstIndex(of: destination) ?? Array<String>.Index(0)]
            longtitude = y5[dstn.firstIndex(of: destination) ?? Array<String>.Index(0)]
        }
        if(arrayno == 6)
         {
            
            latitude = x6[dstn.firstIndex(of: destination) ?? Array<String>.Index(0)]
            longtitude = y6[dstn.firstIndex(of: destination) ?? Array<String>.Index(0)]
        }
        
        let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longtitude)")
        if UIApplication.shared.canOpenURL(url!) {
              UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
        
    }
        
    
    }


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
