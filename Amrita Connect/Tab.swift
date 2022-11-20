//
//  Tab.swift
//  Amrita Connect
//
//  Created by Siddharth on 07/06/22.
//

import SwiftUI

struct Tab: View {
    var body: some View {
      TabView
        {
         MainView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            
        EducationalView()
                .tabItem {
                    Label("Education", systemImage: "books.vertical")
                }
            
            
        GeneralView()
                .tabItem {
                    Label("General", systemImage: "clock")
                }
            
            
      DeveloperView()
                .tabItem {
                    Label("About", systemImage: "person.2")
                }
            
            
        
        
        }
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
