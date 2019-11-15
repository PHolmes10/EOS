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


//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self
//        view = webView
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 155.0 / 255.0, green: 189.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0)
        
        navigationController?.navigationBar.installBlurEffect()
        self.title = "More"
        let navBarHeight: CGFloat = self.navigationController?.navigationBar.frame.height ?? 0.0
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        
//        let burgerBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
//
//        burgerBtn.setImage(UIImage(named: "burger.png"), for: UIControl.State.normal)
//
//        burgerBtn.addTarget(self, action: burgerTapped(), forControlEvents: UIControl.Event.TouchUpInside)
        
        let menuButton = UIButton(type: .system)
        menuButton.setImage(UIImage(named: "menu2"), for: .normal)
        menuButton.tintColor = .black
        menuButton.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: menuButton)
        
        menuButton.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)

        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "menu", style: .plain, target: self, action: #selector(burgerTapped))
        
        

//        let myURL = URL(string:"https://www.theevolutionofsuccess.com/blueprint-video-series-v1")
//        let myRequest = URLRequest(url: myURL!)
//        webView.load(myRequest)
        
        guard let url = URL(string: "https://www.theevolutionofsuccess.com") else { return }
        webView = WKWebView(frame: self.view.frame)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isUserInteractionEnabled = true
        webView.navigationDelegate = self
        self.view.addSubview(self.webView)
        webView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: (navBarHeight)).isActive = true
        webView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: (-150)).isActive = true

        let request = URLRequest(url: url)
        webView.load(request)
        
        // add activity
        self.webView.addSubview(self.activityIndicator)
        self.activityIndicator.style = .whiteLarge
        self.activityIndicator.center = view.center
        self.activityIndicator.color = .black
        self.activityIndicator.startAnimating()
        self.webView.navigationDelegate = self
        self.activityIndicator.hidesWhenStopped = true
        
    }
    
    @objc func menuTapped () {
        print("menu tapped")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
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
}


