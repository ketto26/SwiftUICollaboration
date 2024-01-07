//
//  MovieDetailsView.swift
//  Movies
//
//  Created by Natia Khizanishvili on 07.01.24.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.backdropPath)") {
                    AsyncImage(
                        url: url,
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 200)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }

                Text("Title: \(movie.title)")
                    .font(.title)

                Text("Original Title: \(movie.originalTitle)")
                    .font(.headline)

                Text("Release Date: \(movie.releaseDate)")
                    .font(.headline)

                Text("Overview: \(movie.overview)")

                Text("Popularity: \(String(format: "%.2f", movie.popularity))")

                Text("Vote Average: \(String(format: "%.2f", movie.voteAverage))")

                Text("Vote Count: \(movie.voteCount)")

                HStack {
                    Text("Genres:")
                        .font(.headline)

                    ForEach(movie.genreIds, id: \.self) { genreId in
                        Text("\(genreId)")
                    }
                }
            }
            .padding()
        }
        .navigationTitle(movie.title)
    }
}
