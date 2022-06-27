//
//  EmojiMemoryView.swift
//  Memorize
//
//  Created by Daniel Olatoye on 22/06/2022.
//

import SwiftUI

struct EmojiMemoryView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
        }
    }
}

struct CardView: View {
    
    var card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                        .overlay {
                            shape
                                .strokeBorder(lineWidth: DrawingConstants.lineWidth)
                        }
                    
                    Text(card.content).font(font(in: geometry.size))
                    
                } else if card.isMatched {
                    shape.opacity(0)
                }
                else {
                    shape.fill()
                }
            }
        }
    }
    
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryView(game: game)
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}
