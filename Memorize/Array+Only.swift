//
//  Array+Only.swift
//  Memorize
//
//  Created by Ilia Detchenkov on 29/11/2020.
//

import Foundation

extension Array {
	var only: Element? {
		count == 1 ?first: nil
	}
}
