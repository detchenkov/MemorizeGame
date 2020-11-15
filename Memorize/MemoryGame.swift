//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ilia Detchenkov on 14/11/2020.
//

import Foundation

struct MemoryGame<CardContent> {
	var cards: Array<Card>

	init (numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
		cards = Array<Card>()
		for pairIndex in 0..<numberOfPairsOfCards {
			let content = cardContentFactory(pairIndex)
			cards.append(Card(content: content, id: pairIndex*2))
			cards.append(Card(content: content, id: pairIndex*2+1))
		}
		cards.shuffle()
	}

	func choose(card: Card) {
		print("card chosen: \(card)")
	}

	struct Card: Identifiable {
		var isFaceUp: Bool = true
		var isMatched: Bool = false
		var content: CardContent
		var id: Int
	}
}
