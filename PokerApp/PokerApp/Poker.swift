import Foundation

class Poker {
    
    var dealer: Dealer
    var players: [Player]
    var cardNum: Int
    
    init(dealer: Dealer, players: [Player], cardNum: Int) {
        
        self.dealer = dealer
        self.players = players
        self.cardNum = cardNum
        
    }
    
    func splitCard() {
        
        dealer.splitCard(players: players, cardNum: cardNum)
        
    }
    
    func calculateScore() {
        
    }
    
    func gameEnable() -> Bool {
        
        return players.count < 5 ||  (cardNum == 5 || cardNum == 7) || dealer.deck.count() >= (players.count+1) * cardNum
        
    }
    
    func gameStart() {
        
        if gameEnable() {
            
            self.splitCard()
            Print.printParticipantCards(poker: self)
            
            self.calculateScore()
            
        }
        
    }
    
}
