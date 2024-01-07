//
//  ImageViewExtension.swift
//  SwiftUICollaboration
//
//  Created by tornike <parunashvili on 07.01.24.
//

import SwiftUI

// MARK: - Image Extension

extension Movie {
    func moviePoster(urlString: String, placeholderSize: CGSize, imageSize: CGSize) -> some View {
        Group {
            if let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: imageSize.width, height: imageSize.height)
                            .cornerRadius(8)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: placeholderSize.width, height: placeholderSize.height)
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: placeholderSize.width, height: placeholderSize.height)
                    .foregroundColor(.gray)
            }
        }
    }
}

