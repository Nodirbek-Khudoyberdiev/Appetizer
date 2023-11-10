//
//  AppetizerViewModel.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 09/09/23.
//

import SwiftUI

@MainActor final class AppetizerViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    
    func getAppetizers(){
        isLoading = true
        Task {
            do {
                isLoading = false
                appetizers = try await Networking.shared.getAppetizers()
            } catch {
                isLoading = false
                if let error = error as? APAlert {
                    alertItem = error.alertItem
                } else {
                    alertItem = APAlert.invalidResponse.alertItem
                }
            }
        }
    }

    
}
 
  
