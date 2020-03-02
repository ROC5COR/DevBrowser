//
//  WebView.swift
//  DevBrowserShareExtension
//
//  Created by Romain LE DONGE on 28/02/2020.
//  Copyright © 2020 Romain LE DONGE. All rights reserved.
//

import Foundation
import WebKit

class WebView: WKWebView {
    init() {
        let prefs = WKPreferences()
        prefs.javaScriptEnabled = false
        let config = WKWebViewConfiguration()
        config.preferences = prefs
        super.init(frame: UIScreen.main.bounds, configuration: config)
    }
    
    func loadUrl(_ url: URL){
        self.load(URLRequest(url:url))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
