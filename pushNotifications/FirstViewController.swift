//
//  ViewController.swift
//  pushNotifications
//
//  Created by Deekshith Maram on 1/3/19.
//  Copyright © 2019 Deekshith Maram. All rights reserved.
//

import UIKit
import WebKit

class FirstViewController: UIViewController, WKNavigationDelegate{

   
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        activityIndicator.color = UIColor.black
        activityIndicator.hidesWhenStopped = true
        
        webView.navigationDelegate = self
        
        let url = URL(string: "https://ut.bz.thecapitalnet.com/bz/login")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("start to load")
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finished load")
        activityIndicator.stopAnimating()
    }


}

