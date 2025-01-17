//
//  BaseWebViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/08/27.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import WebKit

class BaseWebViewController: BaseViewController {
    var webViewTitle = ""
    var webViewUrl = ""

    var popupWebView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: BaseWebViewController.self))
        initUi()
        
        self.webView.load(URLRequest(url: URL(string: self.webViewUrl)!))
    }
    
    private let refreshView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        return view
    }()

    private let backButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "btn_back_nor"), for: .normal)
        button.setImage(UIImage(named: "btn_back_touch"), for: .selected)
        button.addTarget(self, action: #selector(goBackWebView), for: .touchUpInside)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.sizeToFit()
        return button
    }()
    private let forwardButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "btn_back_nor"), for: .normal)
        button.setImage(UIImage(named: "btn_back_touch"), for: .selected)
        button.addTarget(self, action: #selector(goForwardWebView), for: .touchUpInside)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.transform = CGAffineTransform(rotationAngle: .pi)
        button.sizeToFit()
        return button
    }()
    
    private let refreshButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "popup_btn_update_2_nor"), for: .normal)
        button.setImage(UIImage(named: "popup_btn_update_touch"), for: .highlighted)
        button.addTarget(self, action: #selector(refreshWebView), for: .touchUpInside)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.sizeToFit()
        return button
    }()
    
    private let webView : WKWebView = {
        var webView = WKWebView()
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        preferences.javaScriptCanOpenWindowsAutomatically = false
        
        let contentController = WKUserContentController()
        //        contentController.add(self, name: "startFacilityList")
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        configuration.userContentController = contentController
        
        webView = WKWebView(frame: CGRect(), configuration: configuration)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.allowsBackForwardNavigationGestures = false
        
        return webView
    }()
}
extension BaseWebViewController {
    func initUi() {
        self.setNavigationItems()
        
        self.view.addSubview(self.refreshView)
        self.refreshView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.navigationHeight)
        }
        self.refreshView.addSubview(self.forwardButton)
        self.forwardButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.refreshView.addSubview(self.backButton)
        self.backButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(self.forwardButton.snp.leading).offset(-50)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.refreshView.addSubview(self.refreshButton)
        self.refreshButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.forwardButton.snp.trailing).offset(50)
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        HTTPCookieStorage.shared.cookieAcceptPolicy = HTTPCookie.AcceptPolicy.always  // 현대카드 등 쿠키설정 이슈 해결을 위해 필요
        self.webView.uiDelegate = self as WKUIDelegate
        self.webView.navigationDelegate = self
        
        self.view.addSubview(self.webView)
        self.webView.snp.makeConstraints { (make) in
            make.top.equalTo(self.refreshView.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    func setNavigationItems(){
        self.setNavigationItemTitle(title: self.webViewTitle)
    }
}
extension BaseWebViewController {
    @objc func refreshWebView(){
        self.webView.reload()
    }
    @objc func goBackWebView(){
        if self.webView.canGoBack {
            self.webView.goBack()
        }
    }
    @objc func goForwardWebView(){
        if self.webView.canGoForward {
            self.webView.goForward()
        }
    }
}
//WK Webview Delegate 기본 설정(전화, 팝업 등)
extension BaseWebViewController: WKUIDelegate {
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        popupWebView = WKWebView(frame: view.bounds, configuration: configuration)
        popupWebView!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        popupWebView!.navigationDelegate = self as WKNavigationDelegate
        popupWebView!.uiDelegate = self as WKUIDelegate
        view.addSubview(popupWebView!)
        
        return popupWebView!
    }
    
    func webViewDidClose(_ webView: WKWebView) {
        if webView == popupWebView {
            popupWebView?.removeFromSuperview()
            popupWebView = nil
        }
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Swift.Void) { let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert); let cancelAction = UIAlertAction(title: "common_confirm".localized, style: .cancel) { _ in completionHandler() }; alertController.addAction(cancelAction); DispatchQueue.main.async { self.present(alertController, animated: true, completion: nil) } }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) { let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert); let cancelAction = UIAlertAction(title: "common_cancel".localized, style: .cancel) { _ in completionHandler(false) }; let okAction = UIAlertAction(title: "common_confirm".localized, style: .default) { _ in completionHandler(true) }; alertController.addAction(cancelAction); alertController.addAction(okAction); DispatchQueue.main.async { self.present(alertController, animated: true, completion: nil) } }
    
    //phone call
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        

        if webView != self.webView {
            decisionHandler(.allow)
            return
        }
        
        let app = UIApplication.shared
        if let url = navigationAction.request.url {
            
            print(url.absoluteString)

            // Handle target="_blank"
            if navigationAction.targetFrame == nil {
                if app.canOpenURL(url) {
                    app.open(url)
                    decisionHandler(.cancel)
                    return
                }
            }
            
            // Handle phone and email links
            if url.scheme == "tel" || url.scheme == "mailto" {
                if app.canOpenURL(url) {
                    app.open(url)
                }
                
                decisionHandler(.cancel)
                return
            }else if !url.absoluteString.hasPrefix("http://") && !url.absoluteString.hasPrefix("https://") {
                if app.canOpenURL(url) {
                    app.open(url, options: [:], completionHandler: nil)
                }
                decisionHandler(.cancel)
                return
            }
            
            decisionHandler(.allow)
        }
    }
}

//WK Webview Delegate
extension BaseWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        Loading.show()
    }
    
    open func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
    }
    

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        if webView.canGoBack {
            self.backButton.isSelected = true
        }else {
            self.backButton.isSelected = false
        }
        if webView.canGoForward {
            self.forwardButton.isSelected = true
        }else {
            self.forwardButton.isSelected = false
        }
        
        Loading.hide()
        
    }
}
