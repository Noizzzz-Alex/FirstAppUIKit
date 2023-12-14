//
//  ChangeThemeService.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 14.12.2023.
//

import Foundation
import UIKit

enum Themes {
    case light
    case dark
    case gray
}

final class CurrentTheme {
    static var currentTheme: Themes = .light
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
    
            

    static func changeThemeButton(buttonLight: UIButton?, buttonDark: UIButton?, buttonGray: UIButton?) {
        switch CurrentTheme.currentTheme {
        case .light:
            buttonLight?.backgroundColor = .black
            buttonDark?.backgroundColor = .white
            buttonGray?.backgroundColor = .white
            buttonLight?.setTitleColor(.white, for: .normal)
            buttonDark?.setTitleColor(.black, for: .normal)
            buttonGray?.setTitleColor(.black, for: .normal)
        case .dark:
            buttonDark?.backgroundColor = .white
            buttonLight?.backgroundColor = .black
            buttonGray?.backgroundColor = .black
            buttonLight?.setTitleColor(.white, for: .normal)
            buttonDark?.setTitleColor(.black, for: .normal)
            buttonGray?.setTitleColor(.white, for: .normal)
        case .gray:
            buttonGray?.backgroundColor = .yellow
            buttonLight?.backgroundColor = .gray
            buttonDark?.backgroundColor = .gray
            buttonLight?.setTitleColor(.white, for: .normal)
            buttonDark?.setTitleColor(.white, for: .normal)
            buttonGray?.setTitleColor(.gray, for: .normal)
        }
    }
}
protocol changeTheme{
    func change()
}
