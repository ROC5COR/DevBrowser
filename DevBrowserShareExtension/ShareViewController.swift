//
//  ShareViewController.swift
//  DevBrowserShareExtension
//
//  Created by Romain LE DONGE on 27/02/2020.
//  Copyright © 2020 Romain LE DONGE. All rights reserved.
//

import UIKit
import Social

class ShareViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Share Extension!")
        
        let webView = WebView()
        self.view = webView
        
        if let item = extensionContext?.inputItems.first as? NSExtensionItem {
            if let itemProvider = item.attachments?.first {
                if itemProvider.hasItemConformingToTypeIdentifier("public.url") {
                    itemProvider.loadItem(forTypeIdentifier: "public.url", options: nil, completionHandler: { (url, error) -> Void in
                        if let url = url as? NSURL {
                            print("URL: "+url.absoluteString!)
                            webView.loadUrl(URL(string:url.absoluteString!)!)
                        }
                    })
                }
            }
        }
    }
    
    
}
