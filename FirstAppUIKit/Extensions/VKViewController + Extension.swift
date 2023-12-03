//
//  VKViewController + Extension.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 01.12.2023.
//

import Foundation
import WebKit

extension ViewController: WKNavigationDelegate {
    
    //1-й вариант написания
//    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
//        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
//            decisionHandler(.allow)
//            return
//        }
//        let params = fragment.components(separatedBy: "&").map { $0.components(separatedBy: "=" ) }.reduce([String: String]()) { result, param in
//            var dict = result
//            let key = param[0]
//            let value = param[1]
//            dict[key] = value
//            return dict
//        }
//        NetworkService.token = params["access_token"]!
//        print(params)
//        //        print(NetworkService.token)
//        //        NetworkService.userID = params["user_id"]!
//        decisionHandler(.cancel)
//        webView.removeFromSuperview()
    ////        tap()
//    }
    
    //2-й вариант написания
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let url = webView.url,
              let fragment = url.fragment,
              let token = extractToken(from: fragment) else { return }

        NetworkService.token = token
        print("Токен: \(NetworkService.token)")
    }

    private func extractToken(from fragment: String) -> String? {
        let components = fragment.components(separatedBy: "&")

        for component in components {
            let keyValue = component.components(separatedBy: "=")
            if keyValue.count == 2 && keyValue[0] == "access_token" {
                return keyValue[1]
            }
        }

        return nil
    }
}
