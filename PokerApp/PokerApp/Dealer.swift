import Foundation

class Dealer: Participant {
    
    var deck : CardDeck
    
    override init(name: String) {
        
        deck = CardDeck()
        deck.shuffle()
        super.init(name: name)
        
    }
    
    func splitCard(players: [Player], cardNum: Int) {
        
        for _ in 1...cardNum {
            for player in players {
                player.getOneCard(card: deck.removeOne())
            }
            self.getOneCard(card: deck.removeOne())
        }
        
    }
    
}
