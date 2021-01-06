//
//  main.swift
//  week1-poker
//
//  Created by 윤준수 on 2021/01/06.
//

import Foundation

class Card{
    enum CardShape: Character{
        case hearts = "♥️", diamonds = "♦️", spades = "♠️", clubs = "♣️"
    }
    
    enum CardRank: String{
        case one = "A", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", ten = "10", eleven = "J", twelve = "Q", thirteen = "K"
    }
    let shape: CardShape
    let rank: CardRank
    
    public init(shape: CardShape, rank: CardRank){
        self.shape = shape
        self.rank = rank
    }
    
    public func getInfo() -> String {
        let info: String = "\(shape.rawValue)\(rank.rawValue)"
        return info
    }
    
    
    
}

var h12 = Card(shape: .hearts, rank: .twelve)
var s7 = Card(shape: .spades, rank: .seven)

print(h12.getInfo())
print(s7.getInfo())
