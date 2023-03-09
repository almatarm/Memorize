//
//  Card.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 15/08/1444 AH.
//

import Foundation
import SwiftUI

struct Card<CardContent>: Identifiable where CardContent: Equatable  {
    var id: Int
    
    var isFlipped = false
    var isMatched = false
    var content: CardContent
    
    func match(_ other: Card<CardContent>) -> Bool {
        return content == other.content
    }
}
