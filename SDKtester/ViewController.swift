//
//  ViewController.swift
//  SDK Tester
//
//  Created by Bondi, Andrea on 20/04/2017.
//  Copyright © 2017 Bondi, Andrea. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Default test URLs
    let nativeXoUrl = "https://ppxoab.herokuapp.com/cart/index.html"
    let btUrl = "https://btnodeab.herokuapp.com/test.html"
    
    // Default values for UI elements
    var selectedSdk = 0
    var url = "https://ppxoab.herokuapp.com/cart/index.html"
    
    @IBOutlet weak var sdkSelector: UISegmentedControl!
    @IBOutlet weak var urlToOpen: UITextField!
    @IBOutlet weak var nativeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        urlToOpen.text = url
        urlToOpen.delegate = self
        
        sdkSelector.selectedSegmentIndex = selectedSdk
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Handle the return key inside text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loadPagePressed(textField)
        return true
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            urlToOpen.text = nativeXoUrl
            nativeSwitch.isEnabled = true
        } else {
            urlToOpen.text = btUrl
            nativeSwitch.isEnabled = false
        }
    }
    
    @IBAction func loadPagePressed(_ sender: Any) {
        if(sdkSelector.selectedSegmentIndex == 0){
            performSegue(withIdentifier: "OpenNativeXO", sender: Any?.self)
        } else {
            performSegue(withIdentifier: "OpenPopupBridge", sender: Any?.self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the URL value to the subsequent VC
        let url = urlToOpen.text
        let nativeSheet = nativeSwitch.isOn
        if let destinationVC = segue.destination as? NativeXOUIWebViewController {
            destinationVC.storeUrl = url!
            destinationVC.nativeSheet = nativeSheet
        } else if let destinationVC = segue.destination as? PopupBridgeViewController {
            destinationVC.storeUrl = url!
        }
    }
    
    // Display info popup
    @IBAction func infoPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "SDK Tester", message: "Tester app for NativeXO and PopupBridge SDK. \n\n ©2018 Andrea Bondi\nandrea@andreabondi.it \n\n THIS APP IS PROVIDED AS IS, see MIT license", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }

}

