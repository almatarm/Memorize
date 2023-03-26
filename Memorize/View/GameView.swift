//
//  ContentView.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 14/08/1444 AH.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var emojiGame: EmojiGameVM
 
    var body: some View {
        VStack {
            HStack {
                Text("Memorize!").font(.largeTitle)
                Text(emojiGame.themeName ?? "").font(.footnote)
            }
            
            Spacer()

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 64))]) {
                    ForEach(emojiGame.cards) { card in
                        EmojiCardView(card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                emojiGame.choose(card)
                            }
                    }
                }
            }
            
            Spacer()
            
            HStack {
                ScoreView(score: emojiGame.score)
                
                Spacer()
                
                ButtonWithImage(title: "New Game", image: "plus.square") {
                    emojiGame.newGame()
                }
            }
            
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


struct ScoreView: View {
    var score: Int
    
    var body: some View {
        VStack {
            let color: Color = score < 0 ? .red : .green
            Text("Score").font(.caption)
            Text(String(abs(score))).font(.title).foregroundColor(color)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var emojiGame = EmojiGameVM(numPairsOfCards: 4, theme: EmojiThemes.vehicles)
    
    static var previews: some View {
        GameView(emojiGame: emojiGame)
    }
}
