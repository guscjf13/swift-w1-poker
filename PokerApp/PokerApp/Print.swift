import Foundation

class Print {
    
    static func printParticipantCards(poker: Poker) {
        
        print("참가자들의 카드입니다.")
        for player in poker.players {
            printCards(participant: player)
        }
        printCards(participant: dealer)
        
    }
    
    static func printCards(participant: Participant) {

        print("\(participant.name) [ ", terminator: "")
        for card in participant.cards {
            print(card.getCardString(), terminator: " ")
        }
        print("]")
        
    }
    
    
}
