//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 22/09/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowindDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 320, height: 225)
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", subtitle: String(appetizer.calories))
                    NutritionInfo(title: "Carbs", subtitle: String(appetizer.carbs))
                    NutritionInfo (title: "Protein", subtitle: String(appetizer.protein))
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowindDetail = false
            } label: {
                Text("$ \(appetizer.price, specifier: "%.2f") - Add to order")
                 
            }
            .modifier(StandartButtonStyle())
            .padding(.bottom, 40)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button {
                isShowindDetail = false
            } label: {
                XDismissButton()
            }
            , alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowindDetail: .constant(true))
    }
}

private struct NutritionInfo: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
                
            Text(subtitle)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
