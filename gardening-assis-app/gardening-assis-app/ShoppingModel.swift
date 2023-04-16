//
//  ShoppingModel.swift
//  gardening-assis-app
//
//  Created by kavindu madushan on 2023-04-17.
//

import SwiftUI

struct shoppingModel: Identifiable {
    var id = UUID()
    var category: String
    var title: String
    var description: String
    var price: String
    var image: String
    
}

struct shoppingList{
    static let allshoppingPlants = [
        shoppingModel(category: "indoor", title: "Oscar Plant", description: "this plant is very beautiful.this plant is very beautiful this plant is very beautiful this plant is very beautiful", price: "5600", image: "plants2"),
        shoppingModel(category: "indoor", title: "Oscar Plant", description: "150", price: "8000", image: "plants2"),
        shoppingModel(category: "indoor", title: "Oscar Plant", description: "150", price: "", image: "plants2"),
        shoppingModel(category: "indoor", title: "Oscar Plant", description: "150", price: "", image: "plants2"),
        shoppingModel(category: "indoor", title: "Oscar Plant", description: "150", price: "", image: "plants2"),
    ]
    
}
