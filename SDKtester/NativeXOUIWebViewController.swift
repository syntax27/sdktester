//
//  NativeXOUIWebViewController.swift
//  SDK Tester
//
//  Created by Bondi, Andrea on 20/04/2017.
//  Copyright © 2017 Bondi, Andrea. All rights reserved.
//

import Foundation

import UIKit
import WebKit

class NativeXOUIWebViewController: UIViewController {
    
    var storeUrl: String = ""
    var nativeSheet: Bool = true
    
    var instance: PYPLCheckout!
    
    @IBOutlet weak var storeWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false;
        
        // Generate the request and quickly check for scheme.
        // If no scheme, add https:// to the url
        var url = URL (string: storeUrl)
        if (url?.scheme) == nil {
            storeUrl = "https://" + storeUrl
            url = URL (string: storeUrl)
        }
        let requestObj = URLRequest(url: url!)
        
        // Retrieve the shared instance of NativeXO and setup the right WebView.
        // NativeXO supports UIWebView
        instance = PYPLCheckout.sharedInstance() as! PYPLCheckout
        if(nativeSheet) {
            instance.webBrowserOnlyMode = false
        } else {
            instance.webBrowserOnlyMode = true
        }
        instance.interceptWebView(storeWebView)
        
        storeWebView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        storeWebView.load(requestObj)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? ViewController
        destinationVC?.selectedSdk = 0
        destinationVC?.url = storeUrl
    }
}
