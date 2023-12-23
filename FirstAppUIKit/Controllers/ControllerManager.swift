//
//  ControllerManager.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 23.12.2023.
//

import Foundation
import UIKit
final class ControllerManager {
    
    var controllers: [ThemeChangeDelegate] = []
    
    func addControllers(controller: ThemeChangeDelegate){
        controllers.append(controller)
    }
    
    func changeTheme(){
        for controller in controllers {
            switch CurrentTheme.currentTheme{
                
            case .light:
                controller.themeDidChanged(toTheme: CurrentTheme.currentTheme)
            case .dark:
                controller.themeDidChanged(toTheme: CurrentTheme.currentTheme)
            case .gray:
                controller.themeDidChanged(toTheme: CurrentTheme.currentTheme)
            }
        }
        
        
    }
}
