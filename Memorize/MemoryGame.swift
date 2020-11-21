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

	mutating func choose(card: Card) {
		print("card chosen: \(card)")
		let chosenIndex: Int = self.index(of: card)
		cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
	}

	func index(of card: Card) -> Int{
		for index in 0..<cards.count {
			if cards[index].id == card.id {
				return index
			}
		}
		return 0 //TODO: bogus!
	}

	struct Card: Identifiable {
		var isFaceUp: Bool = false
		var isMatched: Bool = false
		var content: CardContent
		var id: Int
	}
}
