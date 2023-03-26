//
//  GameViewModel.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 15/08/1444 AH.
//

import Foundation

class EmojiGameVM: ObservableObject {
    @Published private var game: Game<String>
    
    private var numPairsOfCards: Int {
        game.numPairsOfCards
    }
    
    var cards: [Card<String>] {
        game.cards
    }
    
    var themeName: String? {
        game.theme?.name
    }
    
    var score: Int {
        game.score
    }
    
    init(numPairsOfCards: Int, theme: CardsTheme<String>) {
        self.game = Game<String>(numPairsOfCards: 4)
        newGame(theme: theme, numPairsOfCards: numPairsOfCards)
    }
    
    // MARK: Intents
    func choose(_ card: Card<String>) {
        game.choose(card)
    }
    
    func newGame(theme: CardsTheme<String> =  EmojiThemes.randomTheme(), numPairsOfCards: Int = Int.random(in: 3...6)) {
        game = Game<String>(numPairsOfCards: numPairsOfCards)
        game.generateCards(theme: theme)
    }
}
