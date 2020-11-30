//
//  RatingsRestrictionKitTests.swift
//  RatingsRestrictionKitTests
//
//  Created by Justin Kumpe on 11/29/20.
//

import XCTest
import RatingsRestrictionKit

class Tests: XCTestCase {

    override func setUpWithError() throws {
        // Set simulator rating to 400 (R)
        UserDefaults.standard.set(400, forKey: "com.apple.content-rating.MovieRating")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetDeviceMovieRestrictionRaw() {
        XCTAssertEqual(RatingsRestrictionKit.getDeviceMovieRestrictionRaw(), 400)
    }

    func testGetDeviceMovieRestriction() {
        XCTAssertEqual(RatingsRestrictionKit.getDeviceMovieRestriction(), "r")
        XCTAssertNotEqual(RatingsRestrictionKit.getDeviceMovieRestriction(), "pg")
    }

    func testGetMovieRatingValue() {
        XCTAssertEqual(RatingsRestrictionKit.getMovieRatingValue(rating: "r"), 400)
        XCTAssertEqual(RatingsRestrictionKit.getMovieRatingValue(rating: "pg"), 200)
        XCTAssertEqual(RatingsRestrictionKit.getMovieRatingValue(rating: "g"), 100)
        XCTAssertNotEqual(RatingsRestrictionKit.getMovieRatingValue(rating: "r"), 100)
        XCTAssertNotEqual(RatingsRestrictionKit.getMovieRatingValue(rating: "pg"), 400)
        XCTAssertNotEqual(RatingsRestrictionKit.getMovieRatingValue(rating: "g"), 200)
    }

    func testRatingIsAllowed() {
        XCTAssertEqual(RatingsRestrictionKit.ratingIsAllowed(rating: "g"), true)
        XCTAssertEqual(RatingsRestrictionKit.ratingIsAllowed(rating: "pg"), true)
        XCTAssertEqual(RatingsRestrictionKit.ratingIsAllowed(rating: "pg13"), true)
        XCTAssertEqual(RatingsRestrictionKit.ratingIsAllowed(rating: "r"), true)
        XCTAssertEqual(RatingsRestrictionKit.ratingIsAllowed(rating: "nc17"), false)
    }

}
