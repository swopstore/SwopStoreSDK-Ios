//
//  BannerView.swift
//  sdk
//

import Foundation
import WebKit
import UIKit

@IBDesignable
open class BannerView : WKWebView , WKNavigationDelegate{
    
   
    public  init(frame: CGRect) {
        let configuration = WKWebViewConfiguration()
        super.init(frame: frame, configuration: configuration)
        self.navigationDelegate = self
        scrollView.bounces = false
        scrollView.isScrollEnabled = false
     }
    
    public required init?(coder: NSCoder) {
            super.init(coder: coder)
            self.navigationDelegate = self
            scrollView.bounces = false
            scrollView.isScrollEnabled = false
    
        }
    
    
    public  func showBanner(banner : Banner ,scale : Double = 1.0){
        let string = banner.getScript(scale: scale)
        loadHTMLString(string, baseURL: URL(string: "https://swopstore.com"))
    }
    
    public func showDebugBanner(banner : Banner ,scale : Double = 1.0){
        let string = banner.getDebugScript(scale: scale)
        print(string)
        loadHTMLString(string, baseURL: URL(string: "https://swopstore.com"))
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       // heightChange(size: webView.scrollView.contentSize.height)
       // webView.startScript()
     //   webView.scrollView.setContentOffset(CGPoint(x: 0,y: 10), animated: false)
       // webView.scrollView.scrollsToTop = true
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if(navigationAction.navigationType == .linkActivated){
            guard let url = navigationAction.request.url else { return decisionHandler(.allow) }
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:]) { isv in
                    
                }
            }
            return decisionHandler(.allow)
        }else{
            decisionHandler(.allow)
        }
      
    }
}

