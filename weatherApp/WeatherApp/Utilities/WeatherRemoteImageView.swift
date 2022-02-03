//
//  WeatherRemoteImageView.swift
//  WeatherApp
//
//  Created by xavier bohin on 03/02/2022.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURL url: String) {
        NetworkManager.shared.downloadImage(from: url) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image(systemName: "sun.min").resizable()
    }
}


struct WeatherRemoteImage: View {
    
    @StateObject private var imageLoader = ImageLoader()
    var iconString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURL: "https://openweathermap.org/img/wn/"+iconString+"@2x.png") }
    }
}
