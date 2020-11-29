//
//  Grid.swift
//  Memorize
//
//  Created by Ilia Detchenkov on 22/11/2020.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
	var items: [Item]
	var viewForItem: (Item) -> ItemView

	init(items: [Item], viewForItem: @escaping (Item) -> ItemView) {
		self.items = items
		self.viewForItem = viewForItem
	}

	var body: some View {
		GeometryReader { geometry in
			body(for: GridLayout(itemCount: items.count, in: geometry.size))
		}
	}

	func body(for layout: GridLayout)-> some View {
		ForEach(items) {item in
			body(for: item, in: layout)
		}
	}

	func body(for item: Item, in layout: GridLayout) -> some View {
		let index = items.firstIndex(matching: item)
		return viewForItem(item)
			.frame(width: layout.itemSize.width, height: layout.itemSize.height)
			.position(layout.location(ofItemAt: index!))
	}


}
