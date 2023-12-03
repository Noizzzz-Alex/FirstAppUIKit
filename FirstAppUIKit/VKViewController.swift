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
        let webView = WKWebView(frame: view.bounds)
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
    VKViewController()
}
