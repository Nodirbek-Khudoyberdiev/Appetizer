//
//  ImageLoader.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 22/09/23.
//

import SwiftUI


final class ImageLoader: ObservableObject {
    
    @Published var image: Image?
    
    @MainActor
    func load(fromUrlString: String){
        Task {
            if let image = try await Networking.shared.downloadImage(urlString: fromUrlString) {
                self.image = Image(uiImage: image)
            }
        }
    }
    
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("catalyst").resizable()
    }
    
}

struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .task {
                imageLoader.load(fromUrlString: urlString)
            }
    }
    
}
