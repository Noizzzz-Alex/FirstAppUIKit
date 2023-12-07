//
//  FuncLabels.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 07.12.2023.
//

import Foundation
import UIKit

struct Labels {
    static func createLabel(text: String, fontSize: CGFloat, textAlignment: NSTextAlignment, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = textAlignment
        label.textColor = textColor
        label.numberOfLines = 0 // автоматический перенос текста
        label.lineBreakMode = .byWordWrapping // перенос по словам
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

