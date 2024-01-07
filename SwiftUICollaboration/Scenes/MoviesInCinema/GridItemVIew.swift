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
            moviePoster
            movieTitle
        }
        .cornerRadius(8)
        .padding(4)
    }
    
    // MARK: - Subviews

    private var moviePoster: some View {
        movie.moviePoster(urlString: "https://image.tmdb.org/t/p/w500\(movie.posterPath)",
                          placeholderSize: CGSize(width: 100, height: 150),
                          imageSize: CGSize(width: 150, height: 200))
    }
    
    private var movieTitle: some View {
        Text(movie.title)
            .foregroundColor(.white)
            .font(.headline)
            .padding(.top, 5)
            .lineLimit(1)
    }
}

