//
//  ThemeServiceTests.swift
//  FirstAppUIKitTests
//
//  Created by Александр Харлампов on 26.12.2023.
//

import XCTest
@testable import FirstAppUIKit

final class ThemePageControllerTests: XCTestCase {
    var themeController: ThemePageController!
        
        override func setUp() {
            super.setUp()
            themeController = ThemePageController()
            themeController.loadViewIfNeeded()
        }
        
        override func tearDown() {
            themeController = nil
            super.tearDown()
        }
        
        func testChangeBackgroundColor_WhenCurrentThemeIsLight_ShouldSetBackgroundColorToWhite() {
            CurrentTheme.currentTheme = .light
            themeController.changeBackgroundColor()
            XCTAssertEqual(themeController.view.backgroundColor, UIColor.white)
        }
        
        func testChangeBackgroundColor_WhenCurrentThemeIsDark_ShouldSetBackgroundColorToBlack() {
            CurrentTheme.currentTheme = .dark
            themeController.changeBackgroundColor()
            XCTAssertEqual(themeController.view.backgroundColor, UIColor.black)
        }
        
        func testChangeBackgroundColor_WhenCurrentThemeIsGray_ShouldSetBackgroundColorToGray() {
            CurrentTheme.currentTheme = .gray
            themeController.changeBackgroundColor()
            XCTAssertEqual(themeController.view.backgroundColor, UIColor.gray)
        }
}
