//
//  Order.swift
//  coffeeOrdering
//
//  Created by Dmytro Vasylenko on 07.09.2022.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappuchino
    case lattee
    case espresso
    case flatWhite
}

enum CoffeeSize: String, Codable, CaseIterable  {
    case small
    case medium
    case large
}


struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}
