//
//  Card.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/06.
//

import Foundation

class Card {
    
    // 스페이드, 하트 , 다이아, 클로버 네개의 데이터를 열거형으로 정리하기 좋다고 판단해서 enum을 선택하였다.
    enum Shape: Character {
        case spade = "♠︎", heart = "♥︎", diamond = "♦︎", clover = "♣"
    }
    
    // 처음엔 (Int, String)형 딕셔너리로 구현을 하려고 했는데 1부터 13이라는 한정된 범위의 데이터이기 때문에 enum으로 구현하였다.
    // enum의 타입을 String으로 하려고 했지만 추후에 카드의 대소비교가 어려울것같아서 Int형으로 두고 CustomStringConvertible이라는 프로토콜을 사용gkdu
    // 인스턴스를 문자열로 변환해주었다.
    enum Number: Int, CustomStringConvertible {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        
        var description : String {
            switch self {
            case .ace: return "A"
            case .jack: return "J"
            case .queen: return "Q"
            case .king: return "K"
            default: return "\(self.rawValue)"
            }
        }
    }
    
    var shape : Shape
    var number : Number
    
    init(shape:Shape, number:Number) {
        self.shape = shape
        self.number = number
    }
    
    public func printCard() {
        print("\(self.shape.rawValue)\(self.number)")
    }
}
