import Foundation

struct CardDeck {
    
    private(set) var cards : [Card] = [Card]()
    
    init() {
        
        reset()
        
    }
    
    static func ==(left: CardDeck, right: CardDeck) -> Bool {
        
        if left.count() == right.count() {
            
            for index in 0..<left.count() {
                if !(left.cards[index] == right.cards[index]) {
                    return false
                }
            }
            return true
            
        }
        
        return false
        
    }
    
    func count() -> Int {
        
        return cards.count
        
    }
    
    mutating func shuffle() {
        
        print("> 카드 섞기")
        for index in 0..<cards.count {
            
            let randomIndex = Int.random(in: 0..<cards.count)
            
            let cardTemp = cards[index]
            cards[index] = cards[randomIndex]
            cards[randomIndex] = cardTemp
            
        }
        print("전체 \(count())장의 카드를 섞었습니다.\n")
        
    }
    
    mutating public func removeOne() -> Card {
        
        print("> 카드 하나 뽑기")
        let cardRemove = cards[0]
        cards.remove(at: 0)
        
        print(cardRemove.getCardString())
        print("총 \(count())장의 카드가 남아있습니다.\n")
        
        return cardRemove
        
    }
    
    mutating func reset() {
        
        print("> 카드 초기화")
        
        cards.removeAll()
        cards = [Card]()
        
        for index in 1...13 {
            cards.append(Card(shape: .spade, num: index))
            cards.append(Card(shape: .clova, num: index))
            cards.append(Card(shape: .diamond, num: index))
            cards.append(Card(shape: .heart, num: index))
        }
        cards.append(Card(shape: .joker, num: 0))
        
        print("카드 전체를 초기화했습니다.")
        print("총 \(count())장의 카드가 있습니다.\n")
        
    }
    
}
