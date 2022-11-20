//
//  TitleView.swift
//  Amrita Connect
//
//  Created by Vaisakhkrishnan K on 08/06/22.
//

import SwiftUI

struct TitleView: View {
    var image = "logo"
    var name = "Amrita Broadcast"
    var body: some View {
        HStack
        {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(50)
            
            
            HStack
            {
                Text(name)
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Circle()
                    .frame(width: 10, height: 10, alignment: .center)
                    .padding(.bottom)
                    .foregroundColor(.green)
                   
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
           
        }
        .padding()
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
           
    }
}
