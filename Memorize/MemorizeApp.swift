//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 14/08/1444 AH.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject private var emojiGame = EmojiGameVM(numPairsOfCards: 3, theme: EmojiThemes.randomTheme())
    
    var body: some Scene {
        WindowGroup {
            GameView(emojiGame: emojiGame)
        }
    }
}
