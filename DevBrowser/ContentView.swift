//
//  ContentView.swift
//  DevBrowser
//
//  Created by Romain LE DONGE on 23/02/2020.
//  Copyright © 2020 Romain LE DONGE. All rights reserved.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var url = "https://apple.com"
    @State private var haveToLoad = false
    @State private var web = WebView(request: URLRequest(url: URL(string:"https://apple.com")!), disableJavascript: true)
    var body: some View {
        VStack {
            HStack {
                TextField("URL", text: $url, onCommit: {
                    self.web.request.url = URL(string: self.url)!
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    self.web.request.url = URL(string: self.url)!
                }) {
                    Text("Go")
                }
            }
            web
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
