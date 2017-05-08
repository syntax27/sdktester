//
//  PopupBridgeViewController.swift
//  SDK Tester
//
//  Created by Bondi, Andrea on 21/04/2017.
//  Copyright © 2017 Bondi, Andrea. All rights reserved.
//

import Foundation

import UIKit
import WebKit

//import PopupBridge

class PopupBridgeViewController: UIViewController, WKNavigationDelegate, POPPopupBridgeDelegate {

    var storeUrl: String = ""
    var storeWebView: WKWebView!
    
    var popupBridge: POPPopupBridge?
    
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
        
        // Create WKWebView in code, because IB cannot add a WKWebView directly.
        // Popup Bridge only supports WKWebView
        storeWebView = WKWebView()
        storeWebView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(storeWebView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-[storeWebView]-|",
                                                           options: NSLayoutFormatOptions(rawValue: 0),
                                                           metrics: nil,
                                                           views: ["storeWebView": storeWebView]))
        storeWebView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        storeWebView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        storeWebView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        storeWebView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        storeWebView.navigationDelegate = self
        storeWebView.load(requestObj)
   
        // Initialize the Popup Bridge with the correct WKWebView
        popupBridge = POPPopupBridge.init(webView: storeWebView, delegate: self)
    }
    
    // Method to present the Safari View Controller
    func popupBridge(_ bridge: POPPopupBridge, requestsPresentationOf viewController: UIViewController) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Method to dismiss the Safari View Controller
    func popupBridge(_ bridge: POPPopupBridge, requestsDismissalOf viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? ViewController
        destinationVC?.selectedSdk = 1
        destinationVC?.url = storeUrl
    }
}
