//
//  QuestionView.swift
//  Amrita Connect
//
//  Created by Siddharth on 06/06/22.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        NavigationView
        {
            
            ZStack
                {
                    LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 148/255, blue: 130/255), Color(red: 125/255, green: 119/255, blue: 250/255)]),
                        startPoint: .topTrailing,
                                         endPoint: .leading)
                    .edgesIgnoringSafeArea(.all)
                }
          
        }
       
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
