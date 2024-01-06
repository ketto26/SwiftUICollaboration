//
//  GridItemVIew.swift
//  SwiftUICollaboration
//
//  Created by tornike <parunashvili on 06.01.24.
//

import SwiftUI

struct GridItemView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            if !movie.posterPath.isEmpty {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 200)
                            .cornerRadius(8)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 150)
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 150)
                    .foregroundColor(.gray)
            }
            
            Text(movie.title)
                .foregroundColor(.white)
                .font(.headline)
                .padding(.top, 5)
                .lineLimit(1)
        }
        .cornerRadius(8)
        .padding(4)
    }
}
