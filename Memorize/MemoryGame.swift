//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ilia Detchenkov on 14/11/2020.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
	var cards: Array<Card>
	var currentTheme: Int
	var score: Int = 0
	var indexOfTheOnlyFaceupCard: Int? {
		get {	cards.indices.filter { cards[$0].isFaceUp }.only }
		set {
			for index in cards.indices {
				cards[index].isFaceUp = newValue == index
			}
		}
	}

	init (theme: Int, numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
		currentTheme = theme
		cards = Array<Card>()
		for pairIndex in 0..<numberOfPairsOfCards {
			let content = cardContentFactory(pairIndex)
			cards.append(Card(content: content, id: pairIndex*2))
			cards.append(Card(content: content, id: pairIndex*2+1))
		}
		cards.shuffle()
	}

	mutating func choose(card: Card) {
		if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
			if let potentialMatch = indexOfTheOnlyFaceupCard {
				if cards[chosenIndex].content == cards[potentialMatch].content {
					cards[chosenIndex].isMatched = true
					cards[potentialMatch].isMatched = true
					score += 2
				}
				else{
					if cards[chosenIndex].isSeen == true {
						score -= 1
					}
					if cards[potentialMatch].isSeen == true {
						score -= 1
					}
				}
				cards[chosenIndex].isFaceUp = true
				cards[chosenIndex].isSeen = true
				cards[potentialMatch].isSeen = true
			} else {
				indexOfTheOnlyFaceupCard = chosenIndex
			}
		}
	}

	struct Card: Identifiable {
		var isFaceUp: Bool = false
		var isMatched: Bool = false
		var isSeen: Bool = false
		var content: CardContent
		var id: Int
	}
}
