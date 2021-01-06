//
//  main.swift
//  PokerApp
//
//  Created by 이준형 on 2021/01/06.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation
class Card {
    private var shape : Shapes, number : Numbers
    init (shape : Shapes, number : Numbers){
        self.shape = shape
        self.number = number
    }
    
    enum Shapes : String {
        case spade = "♠"
        case heart = "♥"
        case diamond = "◆"
        case club = "♣"
    }
    
    enum Numbers : String {
        case ace = "A"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case eleven = "J"
        case twelve = "Q"
        case thirteen = "K"
    }
    
    var description : String {
           return "\(self.shape.rawValue)\(self.number.rawValue)"
       }
}

let card1 = Card(shape: .heart, number: .six)
print(card1.description)
