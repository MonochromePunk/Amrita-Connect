//
//  SplashScreenView.swift
//  Amrita Connect
//
//  Created by Siddharth on 09/06/22.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 1.5
    @State private var opacity = 0.0
    var body: some View {
        
        if isActive
        {
           ContentView()
               
           

                
        }
        else
        {
            VStack
            {
                Image("logo")
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear
                {
                    withAnimation(.easeIn(duration: 1.2))
                    {
                        self.size = 1
                        self.opacity = 1.0
                    }
                    
                   
                }
                
            
               
            }
            .onAppear
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0)
                {
                    self.isActive = true
                }
            }
           
            
        }
       
       
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
