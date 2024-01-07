//
//  Movie.swift
//  Movies
//
//  Created by Natia Khizanishvili on 07.01.24.
//

import Foundation

typealias Movie = MovieResponse

extension Movie: Identifiable { }

extension Movie {
    static let example = Movie(
        adult: Bool.random(),
        backdropPath: "Example Backdrop Path",
        genreIds: [1, 2, 3,],
        id: Int.random(in: 1...100),
        originalLanguage: "Example Original Language",
        originalTitle: "Example Original Title",
        overview: "Example Overview",
        popularity: Double.random(in: 1...100),
        posterPath: "Poster_Path",
        releaseDate: Date().formatted(),
        title: "Example Title",
        voteAverage: Double.random(in: 0...5),
        voteCount: Int.random(in: 1...100)
    )
}
