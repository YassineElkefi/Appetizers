//
//  Appetizer.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 20/10/2025.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

nonisolated struct AppetizerResponse: Decodable{
    let request: [Appetizer]
}

struct MockData{
    static let sampleAppetizer = Appetizer(id: 1,
                                          name: "Test Appetizers",
                                          description: "This is a description for the appetizer. Delicioso",
                                          price: 20.99,
                                          imageURL: "",
                                          calories: 99,
                                          protein: 99,
                                          carbs: 99)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
