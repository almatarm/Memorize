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
                        .foregroundColor(card.color)
                    Pie(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 130), offsetAngle: Angle(degrees: -90))
                        .foregroundColor(card.color)
                        .opacity(0.40)
                        .padding(4)
                    Text(card.content).font(font(geometry))
                } else if !card.isFlipped {
                    shape.foregroundColor(card.color)
                }
            }
        }
    }
    
    struct DrawingConstants {
        static let fontScale: CGFloat = 0.76
        static let lineWidth: CGFloat = 3
        static let opacity: CGFloat = 0.0
        static let cornerRadius: CGFloat = 10
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
