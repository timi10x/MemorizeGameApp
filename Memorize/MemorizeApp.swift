//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Daniel Olatoye on 22/06/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
