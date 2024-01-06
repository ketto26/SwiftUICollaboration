//
//  PopularPersonsModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import SwiftUI

struct PopularPersonsModel: Decodable {
    let results: [People]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - People
struct People: Decodable, Identifiable {
    var id = UUID()
    let adult: Bool
    let gender: Int
    let knownForDepartment: KnownForDepartment
    let name, originalName: String
    let popularity: Double
    let profilePath: String
    let knownFor: [KnownFor]?

    enum CodingKeys: String, CodingKey {
        case adult, gender
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}

// MARK: - KnownFor
struct KnownFor: Decodable {
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let name: String?
    let originalLanguage: OriginalLanguage
    let originalName: String?
    let overview, posterPath: String
    let mediaType: MediaType
    let genreIDS: [Int]
    let popularity: Double
    let firstAirDate: String?
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [String]?
    let title, originalTitle, releaseDate: String?
    let video: Bool?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, name
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
        case title
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case video
    }
}

enum MediaType: String, Decodable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Decodable {
    case en = "en"
    case fr = "fr"
    case hi = "hi"
    case ja = "ja"
    case ta = "ta"
}

enum KnownForDepartment: String, Decodable {
    case acting = "Acting"
    case writing = "Writing"
}
