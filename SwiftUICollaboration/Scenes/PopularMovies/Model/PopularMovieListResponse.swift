//
//  PopularMovieListResponse.swift
//  Movies
//
//  Created by Natia Khizanishvili on 07.01.24.
//

struct PopularMovieListResponse: Decodable {
    let page: Int
    let results: [MovieResponse]
    let totalPages: Int
    let totalResults: Int

    private enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
