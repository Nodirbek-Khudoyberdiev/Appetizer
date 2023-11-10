//
//  Appetizer.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 04/09/23.
//

import Foundation

struct AppetizerResponse: Codable {
    let request: [Appetizer]
}

struct Appetizer: Codable, Identifiable {
    let id: Int
    let description: String
    let calories: Int
    let name: String
    let price: Double
    let carbs: Int
    let protein: Int
    let imageURL: String
}


struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           description: "This is description for Appetizer" ,
                                           calories: 99,
                                           name: "Test appetizer",
                                           price: 99,
                                           carbs: 99,
                                           protein: 99,
                                           imageURL: "")
    
    
    static let orderItemOne = Appetizer(id: 0001,
                                           description: "This is description for Appetizer" ,
                                           calories: 99,
                                           name: "Test appetizer One",
                                           price: 99,
                                           carbs: 99,
                                           protein: 99,
                                           imageURL: "")
    static let orderItemTwo = Appetizer(id: 0002,
                                           description: "This is description for Appetizer" ,
                                           calories: 99,
                                           name: "Test appetizer Two",
                                           price: 99,
                                           carbs: 99,
                                           protein: 99,
                                           imageURL: "")
    static let orderItemThree = Appetizer(id: 0003,
                                           description: "This is description for Appetizer" ,
                                           calories: 99,
                                           name: "Test appetizer Three",
                                           price: 99,
                                           carbs: 99,
                                           protein: 99,
                                           imageURL: "")
    
    static let appetizers: [Appetizer] = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
    static let orderItems: [Appetizer] = [orderItemOne, orderItemTwo, orderItemThree]
}
