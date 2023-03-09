//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 14/08/1444 AH.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var emojiGame = EmojiGameVM(numPairsOfCards: 4, theme: EmojiThemes.vehicles)
    
    var body: some Scene {
        WindowGroup {
            ContentView(emojiGame: emojiGame)
        }
    }
}
