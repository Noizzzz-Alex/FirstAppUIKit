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
              let token = extractToken(from: fragment, extractingString: "access_token"),
              let userId = extractToken(from: fragment, extractingString: "user_id") else { return }

        NetworkService.token = token
        NetworkService.userId = userId
        transitionToTabBarController()
    }

    private func extractToken(from fragment: String, extractingString: String) -> String? {
        let components = fragment.components(separatedBy: "&")

        for component in components {
            let keyValue = component.components(separatedBy: "=")
            if keyValue.count == 2 && keyValue[0] == extractingString {
                return keyValue[1]
            }
        }

        return nil
    }

    func transitionToTabBarController() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        window.rootViewController = StartPageTabBarController()
        window.makeKeyAndVisible()
    }
}
