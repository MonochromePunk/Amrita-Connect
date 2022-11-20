//
//  CurriculumDisplay.swift
//  Amrita Connect
//
//  Created by Vaisakhkrishnan K on 09/06/22.
//

import SwiftUI
import WebKit

struct CurriculumDisplay: View {
    @State var link: String
    var body: some View {
       
            
            Webview(url: URL(string: link)!)
            
       
       
    }
}

struct Webview: UIViewRepresentable {
    let url: URL

    func makeUIView(context: UIViewRepresentableContext<Webview>) -> WKWebView {
        let webview = WKWebView()

        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)

        return webview
    }

    func updateUIView(_ webview: WKWebView, context: UIViewRepresentableContext<Webview>) {
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
    }
}



struct CurriculumDisplay_Previews: PreviewProvider {
    static var previews: some View {
        CurriculumDisplay(link: "https://intranet.cb.amrita.edu/download/DeanEngg/Curriculum_Syllabus/Undergraduate_Programs/B_Tech_02/B_Tech_Aerospace_Engineering.pdf")
           
    }
}
