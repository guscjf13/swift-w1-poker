import Foundation

class Participant {
    
    var name: String
    var cards: [Card]
    
    init(name: String) {
    
        self.name = name
        self.cards = [Card]()
    
    }
    
    func getOneCard(card: Card) {
        
        self.cards.append(card)
        
    }    
    
}
