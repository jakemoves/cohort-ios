//
//  CHSessionTests.swift
//  Cohort-iOSTests
//
//  Created by Jacob Niedzwiecki on 2018-09-29.
//  Copyright © 2018 Jacob Niedzwiecki. All rights reserved.
//

import XCTest
@testable import Cohort_iOS

class CHSessionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let session = CHSession.init()
        XCTAssertNotNil(session)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
