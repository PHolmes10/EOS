//
//  ShopViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 9/5/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class ShopViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()


        let myURL = URL(string:"https://www.theevolutionofsuccess.com/blueprint-video-series-v1")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

    }

    func webViewDidStartLoad(_ webView: WKWebView){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .whiteLarge
        activityIndicator.color = .blue
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

    func webViewDidFinishLoad(_ webView: WKWebView){
        activityIndicator.stopAnimating()
    }
}


