//
//  VKViewController + Extension.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 01.12.2023.
//

import Foundation
import WebKit

extension VKViewController{
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void){
        guard let url = navigationResponse.response.url,
        url.path == "/blank.html",
        let fragment = url.fragment else {decisionHandler(.allow)
            return}
        _ = fragment.components(separatedBy: "&")
            .map({$0.components(separatedBy: "=")})
            .reduce([String: String]()) {
                result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
    }
}


