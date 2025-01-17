//
//  ParkingFeePaymentWebViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/09/03.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import WebKit

class ParkingFeePaymentWebViewController: BaseWebViewController {
    
    weak var parkingFeePaymentDetail: ParkingFeePaymentDetailViewController!
    var timeOutFlag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ParkingFeePaymentWebViewController.self))
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.timeOutFlag = true
        DispatchQueue.global(qos: .background).async {
            Thread.sleep(forTimeInterval: 5 * 60)
            DispatchQueue.main.async {
                if self.timeOutFlag {
                    self.openOneButtonPopup(title: "parking_fee_payment_fail_title".localized, contents: "parking_fee_payment_time_out".localized, completion: {
                        self.navigationController?.popViewController(animated: true)
                    })
                    
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        self.timeOutFlag = false
    }
    
    override func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        super.webView(webView, didFinish: navigation)
        var currentUrl:String = ""
        
        currentUrl = (webView.url?.absoluteString as String?)!
        
        if currentUrl.contains("parking_pay/failure") {
            
            self.parkingFeePaymentDetail.failParkingPay()
            self.navigationController?.popViewController(animated: true)
            
        } else if currentUrl.contains("parking_pay/success") {
            
            self.parkingFeePaymentDetail.successParkingPay()
            self.navigationController?.popViewController(animated: true)
            
        } else if currentUrl.contains("parking_pay/result") {
            
            webView.evaluateJavaScript("f_result();") { (result, error) in
//                if error != nil {
//                    if webView.canGoBack {
//                        webView.goBack()
//                    }
//                }
            }
            
        }
    }
}
