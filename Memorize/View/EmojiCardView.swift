//
//  CardView.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 16/08/1444 AH.
//

import SwiftUI

struct EmojiCardView : View {
    private let card: Card<String>
    
    init(_ card: Card<String>) {
        self.card = card
    }
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        GeometryReader { geometry in
            ZStack {
                if card.isMatched {
                    shape.opacity(DrawingConstants.opacity)
                } else if card.isFlipped {
                    shape.foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                        .foregroundColor(.cyan)
                    Text(card.content).font(font(geometry))
                } else if !card.isFlipped {
                    shape.foregroundColor(.cyan)
                }
            }
        }
    }
    
    struct DrawingConstants {
        static let fontScale: CGFloat = 0.80
        static let lineWidth: CGFloat = 3
        static let opacity: CGFloat = 0.0
        static let cornerRadius: CGFloat = 15
    }
    
    func font(_ geometry: GeometryProxy) -> Font {
        Font.system(size: min(geometry.size.height, geometry.size.width)
                    * DrawingConstants.fontScale)
    }
}

struct CardView_Previews: PreviewProvider {
    static let card = Card<String>(id: 33, isFlipped: true, color: .green, content: "🌦️")
    static var previews: some View {
        EmojiCardView(card).padding()
    }
}
