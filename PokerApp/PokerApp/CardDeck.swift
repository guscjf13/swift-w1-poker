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
        
        for index in 0..<cards.count {
            
            let randomIndex = Int.random(in: 0..<cards.count)
            
            let cardTemp = cards[index]
            cards[index] = cards[randomIndex]
            cards[randomIndex] = cardTemp
            
        }
        
    }
    
    mutating public func removeOne() -> Card {
        
        let cardRemove = cards[0]
        cards.remove(at: 0)
        
        return cardRemove
        
    }
    
    mutating func reset() {
        
        cards.removeAll()
        cards = [Card]()
        
        for index in 1...13 {
            cards.append(Card(shape: .spade, num: index))
            cards.append(Card(shape: .clova, num: index))
            cards.append(Card(shape: .diamond, num: index))
            cards.append(Card(shape: .heart, num: index))
        }
        cards.append(Card(shape: .joker, num: 0))
        
    }
    
}
