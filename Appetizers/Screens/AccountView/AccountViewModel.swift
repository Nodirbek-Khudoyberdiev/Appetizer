//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 09/10/23.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
  
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty  else {
            alertItem = APAlert.invalidForm.alertItem
            return false
        }
        guard user.email.isValidEmail else {
            alertItem = APAlert.invalidEmail.alertItem
            return false
        }
        return true
    }
    
    func saveChanges(){
        guard isValidForm else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = APAlert.userSaveSuccess.alertItem
        } catch {
            alertItem = APAlert.invalidUserData.alertItem
        }
    }
    
    func retrieveUser(){
        guard let userData else { return }
        do {
            let user = try JSONDecoder().decode(User.self, from: userData)
            self.user = user
        } catch {
            self.alertItem = APAlert.invalidUserData.alertItem
        }
    }
    
}
