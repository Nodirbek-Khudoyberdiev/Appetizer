//
//  Order.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 16/10/23.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    @AppStorage("orders") private var ordersData: Data?
    
    var totalPrice: Double {
        return items.reduce(0){ $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
        saveData(items)
    }
    
    func deleteItems(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        saveData(items)
    }
    
    func retrieveUser(){
        guard let ordersData else { return }
        if let orders = try? JSONDecoder().decode([Appetizer].self, from: ordersData) {
            self.items = orders
        }
    }
    
    private func saveData(_ appetizer: [Appetizer]){
        if let data = try? JSONEncoder().encode(appetizer) {
            ordersData = data
        }
    }
    
}
