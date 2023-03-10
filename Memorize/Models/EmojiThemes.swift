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
                   contents: ["đ", "đ", "đ", "đą", "đĄ", "đ", "đ", "đ", "đ", "đ", "đĩ"])
        
    static let vehicles = CardsTheme(name: "Vehicle",
                   icon: "car",
                   contents:["đ", "đ", "đ", "đ", "đī¸", "đ", "đ", "đ", "đģ", "đĩ"])
        
    static let weather  = CardsTheme(name: "Weather",
                   icon: "sun.max",
                   contents:["âī¸", "đ¤ī¸", "âī¸", "đĻī¸", "đ§ī¸", "đĒī¸", "âī¸", "đ¨", "đŠī¸"])
    
    static func list() -> [CardsTheme<String>] {
        [ faces, vehicles, weather]
    }
}
