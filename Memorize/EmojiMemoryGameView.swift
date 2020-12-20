//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ilia Detchenkov on 14/11/2020.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	@ObservedObject var viewModel: EmojiMemoryGame
	var body: some View {
		VStack{
			HStack{
				Text(viewModel.theme).font(Font.title)
				Spacer()
				Text("Score: \(viewModel.score)").font(Font.title)
			}.padding()
			Grid (items: viewModel.cards) { card in
					CardView(card: card).onTapGesture {
							viewModel.choose(card: card)
						}
						.padding(5)
				}
				.foregroundColor(viewModel.color)
				.padding()
			}
			Button("New game") {
				viewModel.newGame()
			}.padding()
	}
}

struct CardView: View {
	var card: MemoryGame<String>.Card
	var body: some View {
		GeometryReader(content: { geometry in
			body(for: geometry.size)
		})
	}

	func body(for size: CGSize) -> some View {
		ZStack {
			if card.isFaceUp {
				RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
				RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
				Text(card.content)
			} else {
				if !card.isMatched {
					RoundedRectangle(cornerRadius: cornerRadius).fill()
				}
			}
		}
		.font(Font.system(size: fontSize(for: size)))
	}

	//MARK: - Drawing constants
	let cornerRadius: CGFloat = 10.0
	let edgeLineWidth: CGFloat = 3
	func fontSize(for size: CGSize) -> CGFloat {
		min(size.width, size.height) * 0.75
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
