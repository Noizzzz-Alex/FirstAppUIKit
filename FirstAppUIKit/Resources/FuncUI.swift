//
//  FuncLabels.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 07.12.2023.
//

import Foundation
import UIKit

struct Labels {
    static func createLabel(text: String, fontSize: CGFloat, textAlignment: NSTextAlignment, textColor: UIColor, userBorderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = textAlignment
        label.textColor = textColor
        label.numberOfLines = 1 // автоматический перенос текста
        label.lineBreakMode = .byWordWrapping // перенос по словам
        label.layer.borderColor = userBorderColor.cgColor
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
}

