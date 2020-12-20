//
//  EmojiGameTheme.swift
//  Memorize
//
//  Created by Ilia Detchenkov on 20/12/2020.
//

import SwiftUI

struct gameTheme: Identifiable {
	var themeName: String
	var emojiSet: Array<String>
	var color: Color
	var id: Int
}

var themes: Array<gameTheme> = [
	gameTheme(themeName: "Halloween", emojiSet: ["👻", "🎃", "🕷", "🧛🏻", "💀", "🧟‍♂️", "🕸"], color: .orange, id: 0),
	gameTheme(themeName: "X-mas", emojiSet: ["🎁", "🎄", "❄️", "☃️", "🎅🏻", "🍊", "🥂", "🍾"], color: .blue, id: 1),
	gameTheme(themeName: "Birthday", emojiSet: ["🎁", "🎂", "🎉", "🥳", "🎈"], color: .pink, id: 2),
	gameTheme(themeName: "Easter", emojiSet: ["🥚", "🐣", "🐰", "🐇", "🍬", "⛪️"], color: .green, id: 3),
	gameTheme(themeName: "School", emojiSet: ["🖊", "✏️", "📕", "💻", "🎒", "🎓"], color: .red, id: 4)
]

