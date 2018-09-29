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

    func testItConnects() {
        let urlString = "http://jakemoves.local:8080"
        let session = CHSession.init(cohortServerURL: URL(string: urlString)!)
        XCTAssertNotNil(session)
        XCTAssert(session.socketURL == URL(string: urlString)!)
        
        let exp = self.expectation(description: "Connected")
        
        session.connect { (result) in
            if(result){
                exp.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        
        XCTAssertTrue(session.isConnected)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
