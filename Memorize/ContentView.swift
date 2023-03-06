//
//  ContentView.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 14/08/1444 AH.
//

import SwiftUI

struct ContentView: View {
    let themes = [
        CardTheme(name: "Faces",
                  icon: "face.smiling",
                  emojis: ["😂", "😝", "😁", "😱", "😡", "😍", "😉", "😓", "😘", "😜", "😵"]),
     
        CardTheme(name: "Transportation",
                  icon: "car",
                  emojis:["🚗", "🚕", "🚙", "🚌", "🏎️", "🚑", "🚒", "🚜", "🛻", "🛵"]),
    
        CardTheme(name: "Weather",
                  icon: "sun.max",
                  emojis:["☀️", "🌤️", "⛅️", "🌦️", "🌧️", "🌪️", "❄️", "💨", "🌩️"]),
    ]
    
    @State var selectedThemeIndex = 0
    
    var body: some View {
        
        VStack {
            
            Text("Memorize!").font(.largeTitle)
          
            Spacer()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 64))]) {
                    ForEach(themes[selectedThemeIndex].shuffled(), id: \.self) { emoji in
                        Card(emjoi: emoji)
                    }
                }
            }
            
            Spacer()
        
            HStack(spacing: 0) {
                ForEach(Array(themes.enumerated()), id: \.offset) { index,  theme in
                    ButtonWithImage(title: theme.name, image: theme.icon) {
                        selectedThemeIndex = index
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Card : View {
    @State var isFlipped: Bool = true
    var emjoi: String
    
    var body: some View {
        ZStack {
            if isFlipped {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(lineWidth: 3)
                    .foregroundColor(.cyan)
                
                Text(emjoi).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.cyan)
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
        .onTapGesture {
            isFlipped = !isFlipped
        }
    }
}

struct CardTheme {
    var name: String
    var icon: String
    var emojis: [String]
    
    
    func shuffled() -> [String] {
        emojis.shuffled()
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
