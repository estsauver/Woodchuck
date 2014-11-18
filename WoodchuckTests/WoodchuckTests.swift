//
//  WoodchuckTests.swift
//  WoodchuckTests
//
//  Created by Earl J St Sauver on 11/17/14.
//
//

import UIKit
import XCTest
import Woodchuck

class WoodchuckTests: XCTestCase {
    var logger: BaseLogger! = nil
    
    var result: String = ""
    override func setUp() {
        
        super.setUp()
        logger = BaseLogger(logHandler: { self.result += $0 })

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {

        // This is an example of a functional test case.
        logger?.info("Heyo")
        XCTAssertEqual(result, "logLevel = DEBUG|fnName = testExample()|msg = Heyo", "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
