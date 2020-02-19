//
//  PollFishUITests.swift
//  PollFishUITests
//
//  Created by Saeid Hosseinabadi on 2/10/20.
//  Copyright © 2020 Saeid Hosseinabadi. All rights reserved.
//

import XCTest
@testable import Pollfish
class PollFishUITests: XCTestCase {

    let app = XCUIApplication()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Open Slide
    func testOpenSlide() {
        // UI tests must launch the application that they test.
        app.launch()
        let slideButtonButton = app.buttons["Slide Button"]
        slideButtonButton.tap()
        let exiteButon = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .webView).element.children(matching: .webView).element.children(matching: .other).element(boundBy: 0)

        exiteButon.tap()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    // Change Orientation
    func testChangeOrientation() {
        // UI tests must launch the application that they test.
        
        app.launch()
        let slideButtonButton = app.buttons["Slide Button"]
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .webView).element.children(matching: .webView).element.children(matching: .other).element(boundBy: 0)
        
        XCUIDevice.shared.orientation = .landscapeRight
        slideButtonButton.tap()
        element.tap()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
