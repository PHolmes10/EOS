//
//  ShopViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 9/5/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

//import UIKit
//
//class ShopViewController: UITableViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let colors = ShopColors()
//
//        view.backgroundColor = UIColor.clear
//        let backgroundLayer = colors.gl
//        backgroundLayer?.frame = view.frame
//        view.layer.insertSublayer(backgroundLayer!, at: 0)
//
//    }
//
//}


import Foundation
import UIKit
import WebKit

class ShopViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
//    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
//    var webView: WKWebView!
//
//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self
//        view = webView
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        let myURL = URL(string:"https://www.theevolutionofsuccess.com/blueprint-video-series-v1")
//        let myRequest = URLRequest(url: myURL!)
//        webView.load(myRequest)
//
//    }
//
//    func webViewDidStartLoad(_ webView: WKWebView){
//        activityIndicator.center = self.view.center
//        activityIndicator.hidesWhenStopped = true
//        activityIndicator.style = .whiteLarge
//        activityIndicator.color = .blue
//        view.addSubview(activityIndicator)
//        activityIndicator.startAnimating()
//    }
//
//    func webViewDidFinishLoad(_ webView: WKWebView){
//        activityIndicator.stopAnimating()
//    }
//}

    
    
    
//    var webView: WKWebView!
//    var activityIndicator: UIActivityIndicatorView!
//    var webViewContainer:UIView! = UIView()
//
//    override func viewDidLoad() {
//        webView = WKWebView(frame: CGRect.zero)
//        webView.navigationDelegate = self
//        webView.uiDelegate = self
//        view.addSubview(webViewContainer)
//
//        webViewContainer.addSubview(webView)
//
//        activityIndicator = UIActivityIndicatorView()
//        activityIndicator.center = self.view.center
//        activityIndicator.hidesWhenStopped = true
//        activityIndicator.style = .whiteLarge
//        webViewContainer.addSubview(activityIndicator)
//
//        webView.load(URLRequest(url: URL(string: "https://www.theevolutionofsuccess.com/blueprint-video-series-v1")!))
//    }
//
//    func showActivityIndicator(show: Bool) {
//        if show {
//            activityIndicator.startAnimating()
//        } else {
//            activityIndicator.stopAnimating()
//        }
//    }
//
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        showActivityIndicator(show: false)
//        print("finished")
//    }
//
//    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//        showActivityIndicator(show: true)
//        print("navigating")
//    }
//
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        showActivityIndicator(show: false)
//        print("error")
//    }
//}

    
    var webView: WKWebView!
    var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        webView = WKWebView(frame: CGRect.zero)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        self.view.addSubview(webView)
        
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .whiteLarge
        
        self.view.addSubview(activityIndicator)
        
        webView.load(URLRequest(url: URL(string: "https://www.backcountry.com/Store/catalog/search.jsp?s=u&q=mystery+ranch")!))
    }
    
    func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
        print("finished")
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator(show: true)
        print("searching")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
}


