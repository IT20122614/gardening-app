//
//  plantModel.swift
//  gardening-assis-app
//
//  Created by kavindu madushan on 2023-04-13.
//

import SwiftUI

struct plantModel: Identifiable {
    var id = UUID()
    var category: String
    var title: String
    var waterLimit: String
    var fertilizerCount: String
    var pruningPercent: String
    var reportingDays: String
    var image: String
    
}


struct plantList{
    static let allPlants = [
        plantModel(category: "indoor", title: "Oscar Plant", waterLimit: "150", fertilizerCount: "", pruningPercent: "", reportingDays: "", image: "plants2"),
        plantModel(category: "indoor", title: "Oscar Plant", waterLimit: "150", fertilizerCount: "", pruningPercent: "", reportingDays: "", image: "plants3"),
        plantModel(category: "indoor", title: "Oscar Plant", waterLimit: "150", fertilizerCount: "", pruningPercent: "", reportingDays: "", image: "plants4"),
        plantModel(category: "indoor", title: "Oscar Plant", waterLimit: "150", fertilizerCount: "", pruningPercent: "", reportingDays: "", image: "plants5"),
    ]
    
    static let indoorPlants = [
        plantModel(category: "indoor", title: "Oscar Plant", waterLimit: "150", fertilizerCount: "", pruningPercent: "", reportingDays: "", image: "plants2"),
        plantModel(category: "indoor", title: "Oscar Plant", waterLimit: "150", fertilizerCount: "", pruningPercent: "", reportingDays: "", image: "plants1"),
        plantModel(category: "indoor", title: "Oscar Plant", waterLimit: "150", fertilizerCount: "", pruningPercent: "", reportingDays: "", image: "plants4"),
    ]
    
    static let outdoorPlants = [
        plantModel(category: "indoor", title: "Oscar Plant", waterLimit: "150", fertilizerCount: "", pruningPercent: "", reportingDays: "", image: "plants2")
    ]
}


