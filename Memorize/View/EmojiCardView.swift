//
//  CardView.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 16/08/1444 AH.
//

import SwiftUI


struct EmojiCardView : View {
    let card: Card<String>
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 15)
        ZStack {
            if card.isMatched {
                shape.foregroundColor(.green).opacity(0.5)
            } else if card.isFlipped {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3).foregroundColor(.cyan)
                Text(card.content).font(.largeTitle)
            } else if !card.isFlipped {
                shape.foregroundColor(.cyan)
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}
//
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
