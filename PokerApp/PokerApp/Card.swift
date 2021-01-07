import Foundation

class Card {
    
    //shape은 단순히 모양만 나타내면 되고, num은 숫자비교를 위해 Int 선택
    private(set) var shape : Shape
    private(set) var num : Int
    
    enum Shape : Character {
        case spade = "♠️"
        case clova = "♣️"
        case heart = "♥️"
        case diamond = "♦️"
        case joker = "🃏"
    }
    
    init(shape: Shape, num: Int) {
        
        self.shape = shape
        self.num = num
        
    }
    
    static func ==(left: Card, right: Card) -> Bool {
        
        if left.shape == right.shape && left.num == right.num {
            return true
        }
        
        return false
        
    }
    
    func getCardString() -> String {
        
        var cardStr = String(self.shape.rawValue)
        
        switch self.num {
        case 1:
            cardStr.append("A")
        case 11:
            cardStr.append("J")
        case 12:
            cardStr.append("Q")
        case 13:
            cardStr.append("K")
        default:
            cardStr.append(String(num))
        }
        
        return cardStr
        
    }
    
    
}
