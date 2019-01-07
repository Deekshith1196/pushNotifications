//
//  SecondViewController.swift
//  pushNotifications
//
//  Created by Deekshith Maram on 1/4/19.
//  Copyright © 2019 Deekshith Maram. All rights reserved.
//

import UIKit
import WebKit

class SecondViewController: UIViewController,WKNavigationDelegate {

  
    @IBOutlet weak var webView2: WKWebView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.black
    
        
        webView2.navigationDelegate = self
        let url = URL(string: "https://ut.inv.thecapitalnet.com")!
        webView2.load(URLRequest(url: url))
        webView2.allowsBackForwardNavigationGestures = true
    
        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
         print("Strat to load")
       self.activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finished load")
        self.activityIndicator.stopAnimating()
    }
    

  

}
