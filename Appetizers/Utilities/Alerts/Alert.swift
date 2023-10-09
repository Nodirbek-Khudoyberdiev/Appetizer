//
//  Alert.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 15/09/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

