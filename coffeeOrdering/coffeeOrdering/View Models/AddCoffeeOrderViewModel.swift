//
//  AddCoffeeOrderViewModel.swift
//  coffeeOrdering
//
//  Created by Dmytro Vasylenko on 08.09.2022.
//

import Foundation

struct AddCoffeeOrderViewModel {
    
    var name: String?
    var email: String?
    
    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
}
