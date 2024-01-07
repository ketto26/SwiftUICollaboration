//
//  MovieCell.swift
//  Movies
//
//  Created by Natia Khizanishvili on 07.01.24.
//

import SwiftUI

struct MovieCell: View {
    let movie: Movie

    var body: some View {
        HStack(alignment: .top, spacing: 16) { //
            AsyncImage(
                url: URL(string: "https://image.tmdb.org/t/p/w200\(movie.posterPath)"),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 120)
                        .cornerRadius(8)
                },
                placeholder: {
                    ProgressView()
                }
            )

            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.headline)

                Text("Release Date: \(movie.releaseDate)")
                    .font(.subheadline)

                Text("Vote Average: \(String(format: "%.2f", movie.voteAverage))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(movie.overview)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 8)
    }
}


#Preview {
    MovieCell(movie: .example)
}
