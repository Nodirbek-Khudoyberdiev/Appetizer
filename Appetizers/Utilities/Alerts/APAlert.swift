//
//  APError.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 09/09/23.
//

import SwiftUI

enum APAlert: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case failedToDecode
    case invalidForm
    case invalidEmail
    case userSaveSuccess
    case invalidUserData
    
    var alertItem: AlertItem {
        switch self {
        case .invalidURL:
            return AlertItem(title: Text("Server Error"),
                                          message: Text("There was an issue connecting to server. If this persists, please contact support."),
                                          dismissButton: .default(Text("Ok")))
        case .invalidResponse:
            return AlertItem(title: Text("Server Error"),
                             message: Text("The data received from the server was invalid. Please contact support."),
                             dismissButton: .default(Text("Ok")))
        case .invalidData:
            return AlertItem(title: Text("Server Error"),
                             message: Text("The data received from the server was invalid. Please contact support."),
                             dismissButton: .default(Text("Ok")))
        case .unableToComplete:
            return AlertItem(title: Text("Server Error"),
                             message: Text("Unable to complete."),
                             dismissButton: .default(Text("Ok")))

        case .failedToDecode:
            return AlertItem(title: Text("Server Error"),
                             message: Text("Unable to complete."),
                             dismissButton: .default(Text("Ok")))
        case .invalidForm:
            return AlertItem(title: Text("Invalid Form"),
                             message: Text("Please ensure all fields in the form have been filled out."),
                             dismissButton: .default(Text("Ok")))
        case .invalidEmail:
            return AlertItem(title: Text("Invalid Email"),
                             message: Text("Please ensure your email is correct."),
                             dismissButton: .default(Text("Ok")))
        case .userSaveSuccess:
            return AlertItem(title: Text("Profile saved"),
                             message: Text("Your profile information saved successfully."),
                             dismissButton: .default(Text("Ok")))
        case .invalidUserData:
            return AlertItem(title: Text("Profile Error"),
                             message: Text("There was an error saving or retrieving your profile."),
                             dismissButton: .default(Text("Ok")))
        }
    }
}

