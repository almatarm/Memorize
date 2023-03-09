//
//  GameViewModel.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 15/08/1444 AH.
//

import Foundation

class EmojiGameVM: ObservableObject {
    @Published private var game: Game<String>
    
    private var numPairsOfCards: Int
    private var theme: CardsTheme<String>
    
    init(numPairsOfCards: Int, theme: CardsTheme<String>) {
        self.numPairsOfCards = numPairsOfCards
        self.theme = theme
        self.game = Game<String>(numPairsOfCards: numPairsOfCards)
        self.game.generateCards(theme: theme)
    }
    
    func cards() -> [Card<String>] {
        game.cards
    }
    
    // MARK: Intents
    func choose(_ card: Card<String>) {
        game.choose(card)
        
    }
}
