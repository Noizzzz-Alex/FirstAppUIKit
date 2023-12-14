//
//  VKViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 01.12.2023.
//

import UIKit
import WebKit

class AuthorisationPage: UIViewController {
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.bounds)
        webView.backgroundColor = .black
        webView.navigationDelegate = self
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        let urlVK = URL(string: NetworkService.request)
        webView.load(URLRequest(url: urlVK!))
    }

    private func setupViews() {
        view.addSubview(webView)
    }

    
}

#Preview {
    AuthorisationPage()
}
