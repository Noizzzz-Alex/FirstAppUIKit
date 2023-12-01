//
//  VKViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 01.12.2023.
//

import UIKit
import WebKit

class VKViewController: UIViewController {
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
//        let urlYT = URL(string: "https://www.youtube.com/")
        let urlVK = URL(string: Token.request)
        webView.load(URLRequest(url: urlVK!))
    }

    private func setupViews() {
        view.addSubview(webView)
        setupConstraints(controller: webView)
    }

    private func setupConstraints(controller: UIView) {
        controller.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            controller.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            controller.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            controller.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    
    
    
    
    
    
 
    
    
}
#Preview {
    VKViewController()
}
