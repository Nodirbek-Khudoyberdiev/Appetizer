//
//  OrderView.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 31/08/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    Button {
                        
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandartButtonStyle())
                    .padding(.bottom, 25)
                }
                if order.items.isEmpty {
                    EmptyStatesView(imageName: "empty", message: "Default message")
                }
            }
            .onAppear(perform: {
                order.retrieveUser()
            })
            .navigationTitle("Orders 🎧")
        }
    }
    
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
