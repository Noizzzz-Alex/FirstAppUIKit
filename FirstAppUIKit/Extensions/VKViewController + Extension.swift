//
//  VKViewController + Extension.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 01.12.2023.
//

import Foundation
import WebKit

extension VKViewController: WKNavigationDelegate {

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
