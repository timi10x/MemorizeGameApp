//
//  MemoryGame.swift
//  Memorize
//
//  Created by Daniel Olatoye on 23/06/2022.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
