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
		let emojis = ["👻", "🎃", "🕷", "🧛🏻", "💀", "🧟‍♂️", "🕸"]
		let pairs = Int.random(in: 2...5)
		return MemoryGame<String>(numberOfPairsOfCards: pairs) {pairIndex in
			return emojis[pairIndex]}
	}


	//MARK: - Access to the model
	var cards: Array<MemoryGame<String>.Card> {
		game.cards
	}


	//MARK: - Intent(s)
	func choose(card: MemoryGame<String>.Card) {
		game.choose(card: card)
	}

}
