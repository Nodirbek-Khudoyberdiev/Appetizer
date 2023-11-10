//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 31/08/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
