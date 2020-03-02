//
//  WebView.swift
//  DevBrowser
//
//  Created by Romain LE DONGE on 23/02/2020.
//  Copyright © 2020 Romain LE DONGE. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var request: URLRequest
    let disableJavascript: Bool
    typealias UIViewType = WKWebView
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        if disableJavascript {
            let prefs = WKPreferences()
            prefs.javaScriptEnabled = false
            let config = WKWebViewConfiguration()
            config.preferences = prefs
            let view = WKWebView(frame:UIScreen.main.bounds ,configuration: config)
            return view
        } else {
            return WKWebView()
        }
    }
    
    func updateUIView(_ uiView: WebView.UIViewType, context: UIViewRepresentableContext<WebView>) {
        uiView.load(request)
        uiView.allowsBackForwardNavigationGestures = true
    }
    
}
