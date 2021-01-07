//
//  CardDeckTest.swift
//  CardDeckTest
//
//  Created by herb.salt on 2021/01/07.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import XCTest

class CardDeckTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCardDeckInit() throws {
        
        var deck = CardDeck()
        var cards = [Card]()
        var check = true
        
        for index in 1...13 {
            cards.append(Card(shape: .spade, num: index))
            cards.append(Card(shape: .clova, num: index))
            cards.append(Card(shape: .diamond, num: index))
            cards.append(Card(shape: .heart, num: index))
        }
        cards.append(Card(shape: .joker, num: 0))

        if deck.count() == cards.count {
            
            for index in 0..<deck.count() {
                if !(deck.cards[index] == cards[index]) {
                    check = false
                    break
                }
            }
            
        }
        else {
            check = false
        }
        
        XCTAssertTrue(check)
        
    }
    
    func testCardDeckShuffle() throws {
        
        var deckReal = CardDeck()
        var deckTest = CardDeck()
        deckTest.shuffle()
        
        var boolCheck = [Bool](repeating: false, count: deckReal.count())
        var check = true
        
        if deckTest.count() == deckReal.count() {
            for index1 in 0..<deckTest.count() {
                for index2 in 0..<deckReal.count() {
                    if deckTest.cards[index1] == deckReal.cards[index2] {
                        boolCheck[index2] = true
                    }
                }
            }
        }
        else {
            check = false
        }
        
        for index in 0..<boolCheck.count {
            if(!boolCheck[index]) {
                check = false
            }
        }
        
        XCTAssertTrue(check)
        
    }
    
    func testCardDeckRemoveOne() throws {
        
        var deckReal = CardDeck()
        var deckTest = CardDeck()
        deckTest.removeOne()
        
        var boolCheck = [Bool](repeating: false, count: deckReal.count())
        var check = true
        
        for index1 in 0..<deckTest.count() {
            for index2 in 0..<deckReal.count() {
                if deckTest.cards[index1] == deckReal.cards[index2] {
                    boolCheck[index2] = true
                }
            }
        }
        
        var falseNum = 0
        for index in 0..<boolCheck.count {
            if(!boolCheck[index]) {
                falseNum += 1
            }
        }
        
        XCTAssertEqual(falseNum, 1)
        
    }
    
    func testCardDeckReset() throws {
        
        var deck1 = CardDeck()
        var deck2 = CardDeck()
        
        deck1.removeOne()
        deck1.shuffle()
        deck1.removeOne()
        deck1.reset()
        
        XCTAssertTrue(deck1 == deck2)
        
    }

}
