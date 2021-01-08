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
    
    func printCard() {
        
        var str = "\(self.name) ["
        for index in 0..<self.cards.count {
            str.append("\(self.cards[index].getCardString()), ")
        }
        str.append("\(self.cards[self.cards.count-1].getCardString())]")
        
        print(str)
        
    }
    
    
}
