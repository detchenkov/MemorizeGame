//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ilia Detchenkov on 14/11/2020.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
	@Published private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

	//MARK: - Init(s)
	static func createMemoryGame() ->	MemoryGame<String> {
		let currentTheme = Int.random(in: 0..<themes.count)
		var emojis = themes[currentTheme].emojiSet
		emojis.shuffle()
		let pairs = Int.random(in: 2...5)
		return MemoryGame<String>(theme: currentTheme, numberOfPairsOfCards: pairs) {pairIndex in
			return emojis[pairIndex]}
	}


	//MARK: - Access to the model
	var cards: Array<MemoryGame<String>.Card> {
		game.cards
	}

	var theme: String {
		themes[game.currentTheme].themeName
	}

	var color: Color {
		themes[game.currentTheme].color
	}

	var score: Int {
		game.score
	}


	//MARK: - Intent(s)
	func choose(card: MemoryGame<String>.Card) {
		game.choose(card: card)
	}

	func newGame() {
		game = EmojiMemoryGame.createMemoryGame()
	}
	
}
