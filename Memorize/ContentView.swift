//
//  ContentView.swift
//  Memorize
//
//  Created by Daniel Olatoye on 22/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var emojiCount = 20
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding(.horizontal)
                .foregroundColor(.red)
            }
        }
        
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                    .overlay {
                        shape
                            .strokeBorder(lineWidth: 3)
                    }
                
                Text(content)
                    .font(.largeTitle)
                    .foregroundColor(.orange)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}
