//
//  CardTest.swift
//  CardTest
//
//  Created by herb.salt on 2021/01/07.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import XCTest

class CardTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMakeCardInstance() throws {
        var card = Card(shape: .heart, num: 12)
        XCTAssertEqual(card.getCardString(), "♥️Q")
    }

}
