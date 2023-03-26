//
//  Card.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 15/08/1444 AH.
//

import Foundation
import SwiftUI

struct Card<CardContent>: Identifiable where CardContent: Equatable  {
    let id: Int
    
    var isFlipped = false
    var isMatched = false
    var seen = false
    var color: Color
    let content: CardContent
    
    func match(_ other: Card<CardContent>) -> Bool {
        return content == other.content
    }
}
