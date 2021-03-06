//
//  ViewController.swift
//  Project4
//
//  Created by Macbook on 06/04/2017.
//  Copyright © 2017 Chappy-App. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

     var webView: WKWebView!
     
     
     override func loadView() {
          webView = WKWebView()
          webView.navigationDelegate = self
          view = webView
          
     }

     override func viewDidLoad() {
          super.viewDidLoad()
          
          let url = URL(string: "https://www.hackingwithswift.com")!
          webView.load(URLRequest(url: url))
          webView.allowsBackForwardNavigationGestures = true
          
          navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
          
          
     }
     
     func openTapped() {
          
          let ac = UIAlertController(title: "Open Page...", message: nil , preferredStyle: .actionSheet)
          ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
          ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
          ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
          ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
          present(ac, animated: true)
          
     }
     
     func openPage(action: UIAlertAction) {
          let url = URL(string: "https://" + action.title!)!
          webView.load(URLRequest(url: url))
     
     }
     
     func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
          title = webView.title
     }

     override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
     }


}

