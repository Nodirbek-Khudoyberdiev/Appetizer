//
//  ImageLoader.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 22/09/23.
//

import SwiftUI


final class ImageLoader: ObservableObject {
    
    @Published var image: Image?
    
    func load(fromUrlString: String){
        Networking.shared.downloadImage(urlString: fromUrlString) { uiImage in
            guard let uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
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
            .onAppear {
                imageLoader.load(fromUrlString: urlString)
            }
    }
    
}
