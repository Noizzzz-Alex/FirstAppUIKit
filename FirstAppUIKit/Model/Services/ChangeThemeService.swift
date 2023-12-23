//
//  ChangeThemeService.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 14.12.2023.
//

import Foundation
import UIKit

enum ThemeType {
    case light
    case dark
    case gray
}


final class CurrentTheme {
    static var currentTheme: ThemeType = .light {
        didSet {
            themeDelegate?.themeDidChanged(toTheme: currentTheme)
        }
    }
    static weak var themeDelegate: ThemeChangeDelegate?
}
struct Theme {
    static func isTheme(view: UIView) {
        switch CurrentTheme.currentTheme{
            
        case .light:
            view.backgroundColor = .white
        case .dark:
            view.backgroundColor = .black
        case .gray:
            view.backgroundColor = .gray
        }
    }
}

protocol BackgroundColor {
    func changeBackgroundColor()
}
