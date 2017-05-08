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

class NativeXOUIWebViewController: UIViewController, UIWebViewDelegate {
    
    var storeUrl: String = ""
    
    var instance: PYPLCheckout!
    
    @IBOutlet weak var storeWebView: UIWebView!
    
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
        instance.setWebView(storeWebView)
        
        storeWebView.delegate = self
        storeWebView.loadRequest(requestObj)
    }
    
    // Since this class is also the UIWebView delegate, every load URL request will
    // trigger this method.
    // The NativeXO handleIfPPCheckout method will detect if it's a PayPal Checkout URL
    // and take ownership if it's true.
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return instance.handleIfPPCheckout(request as URLRequest!);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? ViewController
        destinationVC?.selectedSdk = 0
        destinationVC?.url = storeUrl
    }
}
