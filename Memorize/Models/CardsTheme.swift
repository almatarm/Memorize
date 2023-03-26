//
//  Theme.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 15/08/1444 AH.
//

import Foundation
import SwiftUI

struct CardsTheme<Content> {
    var name: String
    var icon: String
    var color: Color
    var contents: [Content]
    
    func shuffled() -> [Content] {
        contents.shuffled()
    }
}
