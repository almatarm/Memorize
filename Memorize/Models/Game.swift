//
//  Game.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 15/08/1444 AH.
//

import Foundation

struct Game<CardContent> where CardContent: Equatable {
    var numPairsOfCards: Int
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
            } else {
                theFirstFlippedCard = chosenCardIdx
            }
            
//            print("ChosenCardIdx \(chosenCardIdx), isFlipped: \(cards[chosenCardIdx].isFlipped)")
//            cards[chosenCardIdx].isFlipped = true;
//
//            if let theSecondFlippedCard = theSecondFlippedCard, let theFirstFlippedCard = theFirstFlippedCard {
//                cards[theFirstFlippedCard].isFlipped = false
//                cards[theSecondFlippedCard].isFlipped = false
//                self.theFirstFlippedCard = chosenCardIdx
//                self.theSecondFlippedCard = nil
//            } else if let theFirstFlippedCard = theFirstFlippedCard {
//                //One of the card is already flipped
//                self.theSecondFlippedCard = chosenCardIdx
//
//                if(cards[theFirstFlippedCard].match(cards[chosenCardIdx])) {
//                    //match
//                    cards[theFirstFlippedCard].isMatched = true
//                    cards[chosenCardIdx].isMatched = true
////                    self.theFirstFlippedCard = nil
////                    self.theSecondFlippedCard = nil
//                }
//            } else {
//                theFirstFlippedCard = chosenCardIdx
//            }
//            if let theOtherFlippedCardIndex = theOtherFlippedCardIndex {
//                if cards[chosenCardIdx].match(cards[theOtherFlippedCardIndex]) {
//                    // Found a match
//                    print("Found a Match: Other \(theOtherFlippedCardIndex) \(cards[theOtherFlippedCardIndex].content) == chosen Other \(chosenCardIdx) \(cards[chosenCardIdx].content)")
//                    cards[chosenCardIdx].isFlipped = true
//                    cards[chosenCardIdx].isMatched = true
//                    cards[theOtherFlippedCardIndex].isMatched = true
//                    self.theOtherFlippedCardIndex = nil
//                    print(cards)
//                }
//                else {
//                    // No Match
//                    print("No Match: Other \(theOtherFlippedCardIndex)")
//                    self.cards[chosenCardIdx].isFlipped = false
//                    self.cards[theOtherFlippedCardIndex].isFlipped = false
//                }
//            } else {
//                // No other card filpped, this is the only card flipped
//                theOtherFlippedCardIndex = chosenCardIdx
//                cards[chosenCardIdx].isFlipped.toggle()
//                print("the only filppied card \(String(describing: theOtherFlippedCardIndex))")
//            }
            
        }
    }
    
    mutating func generateCards(theme: CardsTheme<CardContent>) {
        cards.removeAll()
        for idx in 0..<(min(numPairsOfCards, theme.contents.count)) {
            cards.append(Card<CardContent>(id: idx * 2    , content: theme.contents[idx]))
            cards.append(Card<CardContent>(id: idx * 2 + 1, content: theme.contents[idx]))
        }
//        cards.shuffle()
    }
    
    
}

extension Array {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
