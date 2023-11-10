//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 28/10/23.
//

import SwiftUI

struct StandartButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
