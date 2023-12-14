//
//  FuncLabels.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 07.12.2023.
//

import Foundation
import UIKit

struct Labels {
    static func createLabel(text: String, fontSize: CGFloat, textAlignment: NSTextAlignment, borderWidth: CGFloat, cornerRadius: CGFloat) -> UILabel {
        let label = UILabel()
        switch CurrentTheme.currentTheme{
            
        case .light:
            label.textColor = .black
            label.layer.borderColor = UIColor.black.cgColor
        case .dark:
            label.textColor = .white
            label.layer.borderColor = UIColor.white.cgColor
        case .gray:
            label.textColor = .yellow
            label.layer.borderColor = UIColor.yellow.cgColor
        }
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = textAlignment
        label.numberOfLines = 1 // автоматический перенос текста
        label.lineBreakMode = .byWordWrapping // перенос по словам
        label.layer.borderWidth = borderWidth
        label.layer.cornerRadius = cornerRadius
        return label
    }
}

struct CircleViews {
    static func createCircleUIView(color: UIColor, radius: CGFloat) -> UIView {
        let circle = UIView()
        circle.backgroundColor = color
        circle.layer.cornerRadius = radius
        return circle
    }
}

struct Buttons{
    static func createButton(type: UIButton.ButtonType, text: String, state: UIControl.State, target: Any?, action: Selector, event: UIControl.Event ) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: state)
        button.addTarget(target, action: action, for: event)
        return button
    }
    static func createSimpleButton(title: String, state: UIControl.State ) -> UIButton {
        let button = UIButton()
        switch CurrentTheme.currentTheme{
            
        case .light:
            button.backgroundColor = .black
            button.setTitleColor(.white, for: .normal)
        case .dark:
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
        case .gray:
            button.backgroundColor = .yellow
            button.setTitleColor(.black, for: .normal)
        }
        button.setTitle(title, for: state)
        button.setTitleColor(.red, for: .highlighted)
        return button
    }
}

