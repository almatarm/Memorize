//
//  EmojiThemes.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 16/08/1444 AH.
//

import Foundation
import SwiftUI

struct EmojiThemes {
    static let faces = CardsTheme(name: "Faces", icon: "face.smiling", color: .green,
                   contents: ["😂", "😝", "😁", "😱", "😡", "😍", "😉", "😓", "😘", "😜", "😵"])
        
    static let vehicles = CardsTheme(name: "Vehicle", icon: "car", color: .gray,
                   contents:["🚗", "🚕", "🚙", "🚌", "🏎️", "🚑", "🚒", "🚜", "🛻", "🛵"])
        
    static let weather  = CardsTheme(name: "Weather", icon: "sun.max", color: .yellow,
                   contents:["☀️", "🌤️", "⛅️", "🌦️", "🌧️", "🌪️", "❄️", "💨", "🌩️"])
    
    static func list() -> [CardsTheme<String>] {
        [ faces, vehicles, weather]
    }
    
    static func randomTheme() -> CardsTheme<String> {
        return list().randomElement()!
    }
}
