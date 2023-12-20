//
//  BugTests.swift
//  BugTests
//
//  Created by pitel on 12/19/23.
//

import XCTest
@testable import Bug

final class BugTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /*
     Uncomment the test below to test the sum function
     */
    
//    func testSum() throws {
//      XCTAssert(sum(2, 4) == 6)
//      XCTAssert(sum(3, 0) == 3)
//      XCTAssert(sum(-3, 0) == -3)
//    }

    /*
     The best below will check if data
     from json file was decoded properly
     */
    
    func testMovie() throws {
            
      // 1
      let bundle = Bundle(for: type(of: self))

      guard let url = bundle.url(forResource: "data", withExtension: "json") else {
        XCTFail("Missing file: data.json")
        return
      }

      let json = try Data(contentsOf: url)
      let decoder = JSONDecoder()
            
      // 2
      let movie = try decoder.decode(Movie.self, from: json)

      XCTAssertNotNil(movie)
      XCTAssertEqual(movie.name, "Titanic")
            
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MM/dd/yy"
      let date = dateFormatter.date(from: "12/19/1997")
      XCTAssertEqual(movie.releaseDate, date)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
