//
//  ContentView.swift
//  Memorize
//
//  Created by Ilia Detchenkov on 14/11/2020.
//

import SwiftUI

struct ContentView: View {
	var viewModel: EmojiMemoryGame
	var body: some View {
		HStack
		{
			ForEach(viewModel.cards)
			{ card in
				CardView(card: card)
					.onTapGesture {
						viewModel.choose(card: card)
					}
			}
		}
			.foregroundColor(Color.orange)
			.padding()
			.font(viewModel.cards.count == 5 ? Font.largeTitle : Font.title)
	}
}

struct CardView: View {
	var card: MemoryGame<String>.Card
	var body: some View {
		ZStack
		{
			if card.isFaceUp {
				RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
				RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
				Text(card.content)
			} else
			{
				RoundedRectangle(cornerRadius: 10.0).fill()
			}
		}
			.frame(width: 40, height: 60)
	}
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
