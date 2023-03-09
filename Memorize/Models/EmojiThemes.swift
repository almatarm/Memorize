//
//  EmojiThemes.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 16/08/1444 AH.
//

import Foundation

struct EmojiThemes {
    static let faces = CardsTheme(name: "Faces",
                   icon: "face.smiling",
                   contents: ["😂", "😝", "😁", "😱", "😡", "😍", "😉", "😓", "😘", "😜", "😵"])
        
    static let vehicles = CardsTheme(name: "Vehicle",
                   icon: "car",
                   contents:["🚗", "🚕", "🚙", "🚌", "🏎️", "🚑", "🚒", "🚜", "🛻", "🛵"])
        
    static let weather  = CardsTheme(name: "Weather",
                   icon: "sun.max",
                   contents:["☀️", "🌤️", "⛅️", "🌦️", "🌧️", "🌪️", "❄️", "💨", "🌩️"])
    
    static func list() -> [CardsTheme<String>] {
        [ faces, vehicles, weather]
    }
}
