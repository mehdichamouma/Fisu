//
//  FisuTests.swift
//  FisuTests
//
//  Created by Mehdi Chamouma on 11/04/2016.
//  Copyright © 2016 Mehdi Chamouma. All rights reserved.
//
import XCTest
@testable import Fisu

class FisuTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitialization() {
        let moc = App.getMoc()
        App.initialize()
        App.initialize()
        XCTAssertEqual(Day.findAll(moc).count, 7)
        XCTAssertEqual(Activity.findAll(moc).count, 6)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
