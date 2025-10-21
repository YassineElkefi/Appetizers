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
                                          name: "Test Appetizer",
                                          description: "This is a description for the appetizer. Delicioso",
                                          price: 20.99,
                                          imageURL: "",
                                          calories: 99,
                                          protein: 99,
                                          carbs: 99)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: 1,
                                        name: "Test Appetizer 1",
                                        description: "This is a description for the appetizer. Delicioso",
                                        price: 20.99,
                                        imageURL: "",
                                        calories: 99,
                                        protein: 99,
                                        carbs: 99)
    
    static let orderItemTwo = Appetizer(id: 2,
                                        name: "Test Appetizer 2",
                                        description: "This is a description for the appetizer. Delicioso",
                                        price: 20.99,
                                        imageURL: "",
                                        calories: 99,
                                        protein: 99,
                                        carbs: 99)
    
    static let orderItemThree = Appetizer(id: 3,
                                        name: "Test Appetizer 3",
                                        description: "This is a description for the appetizer. Delicioso",
                                        price: 20.99,
                                        imageURL: "",
                                        calories: 99,
                                        protein: 99,
                                        carbs: 99)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
