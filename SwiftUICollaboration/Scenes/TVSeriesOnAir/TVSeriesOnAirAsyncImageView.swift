//
//  TVSeriesOnAirAsyncImageView.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 07.01.24.
//

import SwiftUI
import Combine

// MARK: - Async Image View
struct AsyncImageView: View {
    @StateObject private var imageLoader: ImageLoader
    
    init(url: URL) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 75)
                    .cornerRadius(8)
            } else {
                if imageLoader.isLoading {
                    ProgressView()
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 75)
                        .cornerRadius(8)
                }
            }
        }
        .onAppear {
            imageLoader.load()
        }
    }
}

// MARK: - Image Loader
final class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading = false
    
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    func load() {
        isLoading = true
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] loadedImage in
                self?.isLoading = false
                self?.image = loadedImage
            }
    }
}
