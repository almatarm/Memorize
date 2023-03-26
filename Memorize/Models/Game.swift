//
//  Game.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 15/08/1444 AH.
//

import Foundation

struct Game<CardContent> where CardContent: Equatable {
    var score = 0
    var numPairsOfCards: Int
    var theme: CardsTheme<CardContent>?
    private(set) var cards: [Card<CardContent>] = []
    
    var theFirstFlippedCard: Int? {
        get { cards.indices.filter({ cards[$0].isFlipped }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFlipped = $0 == newValue } }
    }

    var theSecondFlippedCard: Int?
    
    var numCards: Int {
        numPairsOfCards * 2
    }
    
    mutating func choose(_ card: Card<CardContent>) {
        if let chosenCardIdx = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenCardIdx].isFlipped,
           !cards[chosenCardIdx].isMatched {
            
            if let theOnlyFlipedCard = theFirstFlippedCard {
                // We already have one card fliped, check for match
                if cards[chosenCardIdx].match(cards[theOnlyFlipedCard]) {
                    cards[chosenCardIdx].isMatched = true
                    cards[theOnlyFlipedCard].isMatched = true
                }
                cards[chosenCardIdx].isFlipped = true
                
                refreshScore(cards[chosenCardIdx], cards[theOnlyFlipedCard])
                cards[chosenCardIdx].seen = true
                cards[theOnlyFlipedCard].seen = true
            } else {
                theFirstFlippedCard = chosenCardIdx
            }
        }
    }
    
    mutating private func refreshScore(_ card1: Card<CardContent>, _ card2: Card<CardContent>) {
        if (card1.match(card2)) {
            score += 2
        } else {
            score += card1.seen ? -1 : 0
            score += card2.seen ? -1 : 0
        }
    }
    
    mutating func generateCards(theme: CardsTheme<CardContent>) {
        self.theme = theme
        cards = []
        let themeCards = theme.contents.shuffled()
        for idx in 0..<(min(numPairsOfCards, themeCards.count)) {
            cards.append(Card<CardContent>(id: idx * 2    , color: theme.color, content: themeCards[idx]))
            cards.append(Card<CardContent>(id: idx * 2 + 1, color: theme.color, content: themeCards[idx]))
        }
        cards.shuffle()
    }
}

extension Array {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
