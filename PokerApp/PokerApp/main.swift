import Foundation

var printClass = Print()

var dealer = Dealer(name: "딜러")

var player1 = Player(name: "참가자1")
var player2 = Player(name: "참가자2")
var player3 = Player(name: "참가자3")
var players = [player1, player2, player3]

var poker = Poker(dealer: dealer, players: players, cardNum: 7)

poker.gameStart()
