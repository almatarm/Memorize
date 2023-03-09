//
//  ContentView.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 14/08/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var emojiGame: EmojiGameVM
    
//    @State var selectedThemeIndex = 0
    
    var body: some View {
        
        VStack {
            
            Text("Memorize!").font(.largeTitle)
            Spacer()

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 64))]) {
                    ForEach(emojiGame.cards()) { card in
                        EmojiCardView(card: card)
                            .onTapGesture {
                                emojiGame.choose(card)
                            }
                    }
                }
            }
            
            Spacer()
        
//            HStack(spacing: 0) {
//                ForEach(Array(emojiGame.themesList().enumerated()), id: \.offset) { index,  theme in
//                    ButtonWithImage(title: theme.name, image: theme.icon) {
//                        selectedThemeIndex = index
//                    }
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                }
//            }
//            .padding(.horizontal)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var emojiGame = EmojiGameVM(numPairsOfCards: 4, theme: EmojiThemes.vehicles)
    
    static var previews: some View {
        ContentView(emojiGame: emojiGame)
    }
}


struct ButtonWithImage: View {
    var title: String
    var image: String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: image).font(.largeTitle)
                    .padding(.bottom, 1)
                Text(title).font(.caption)
            }
        }
    }
}
