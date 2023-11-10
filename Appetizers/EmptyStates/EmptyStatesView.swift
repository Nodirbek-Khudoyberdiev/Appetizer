//
//  EmptyStatesView.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 10/10/23.
//

import SwiftUI

struct EmptyStatesView: View {
    let imageName: String
    let message: String
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 150)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyStatesView(imageName: "empty", message: "Default message")
}
