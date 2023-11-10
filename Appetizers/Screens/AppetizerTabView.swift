//
//  AppetizerTabView.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 31/08/23.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            OrderView()
                .tabItem { Label("Orders", systemImage: "bag") }
                .badge(order.items.count)
        }
//        .tint(.brandPrimary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
