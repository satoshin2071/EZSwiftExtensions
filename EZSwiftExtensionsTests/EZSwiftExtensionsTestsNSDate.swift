//
//  EZSwiftExtensionsTestsNSDate.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

class EZSwiftExtensionsTestsNSDate: XCTestCase {
  
  //note that NSDate uses UTC in NSDate(timeIntervalSince1970: _)
  
    var string: String!
    let format = "dd-mm-yyyy hh:mm:ss"
  
    override func setUp() {
        super.setUp()
        string = "01-01-1970 00:00:00"
    }
  
    func testDateFromString() {
        guard let dateFromString = NSDate(fromString: string, format: format) else {
            XCTFail("Date From String Couldn't be initialized.")
            return
        }
        XCTAssertEqualWithAccuracy(dateFromString.timeIntervalSince1970, 0, accuracy: 60 * 60 * 24)
    }
  
    func testDateToString() {
        let dateToString = NSDate(timeIntervalSince1970: 0).toString(format: format)
        guard let dateFromString = NSDate(fromString: dateToString, format: format) else {
            XCTFail("Date From String Couldn't be initialized.")
            return
        }
        XCTAssertEqualWithAccuracy(dateFromString.timeIntervalSince1970, 0, accuracy: 60 * 60 * 24)
    }
  
    func testTimePassedBetweenDates() {
        let date = NSDate(timeIntervalSince1970: 0)
        XCTAssertTrue(date.timePassed().containsString("years"))
        let now = NSDate()
        XCTAssertTrue(now.timePassed().containsString("now") || now.timePassed().containsString("seconds"))
    }
  
    func testComparable() {
        let date = NSDate()
        let future = NSDate(timeIntervalSinceNow: 1000)
        XCTAssertTrue(date < future)
        XCTAssertFalse(date > future)
        XCTAssertTrue(date == date)
    }
  
}