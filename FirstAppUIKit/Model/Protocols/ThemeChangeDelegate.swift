//
//  ThemeChangeDelegate.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 22.12.2023.
//

import Foundation
protocol ThemeChangeDelegate: AnyObject{
    func themeDidChanged(toTheme: ThemeType)
}
