//
//  WebView.swift
//  hw2
//
//  Created by User03 on 2020/10/14.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: String
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    typealias UIViewType = WKWebView
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url:"https://www.thelittleprince.com")
    }
}
