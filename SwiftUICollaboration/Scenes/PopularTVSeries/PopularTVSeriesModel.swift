//
//  PopularTVSeriesModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import Foundation

// MARK: - ProductData
struct TVShowData: Decodable {
    let results: [TVShow]
}

// MARK: - Result
struct TVShow: Decodable, Hashable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let originCountry: [String]
    let posterPath, firstAirDate, name: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id
        case originCountry = "origin_country"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name
        case voteAverage = "vote_average"
    }
}



