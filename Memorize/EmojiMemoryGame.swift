//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Daniel Olatoye on 23/06/2022.
//

import SwiftUI


class EmojiMemoryGame {
    private(set) var model: MemoryGame<String> = MemoryGame(numberofPairsOfCards: 4) { pairIndex in "😀" }
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
