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
        transitionToTabBarController()
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

    private func tap() {
        let tabBarVC = UINavigationController(rootViewController: StartPageTabBarController())

        func goTabController() {
            navigationController?.pushViewController(tabBarVC, animated: true)
            navigationController?.isNavigationBarHidden = true
        }
        goTabController()

        //        guard let scene1 = UIApplication.shared.connectedScenes.first as? UIWindowScene,
        //              let window1 = scene1.windows.first else { return }
        //        window1.rootViewController = tabTabController
    }

    func transitionToTabBarController() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        window.rootViewController = StartPageTabBarController() //зесь уже имеющийся tabbarcontroller
        window.makeKeyAndVisible()
    }
}
