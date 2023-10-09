//
//  AppetizerViewModel.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 09/09/23.
//

import SwiftUI

final class AppetizerViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    
    func getAppetizers(){
        isLoading = true
        Networking.shared.getAppetizers {[self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    alertItem = error.alertItem
                }
                isLoading = false
            }
        }
    }
    
}
