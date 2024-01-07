//
//  TVSeriesDetailsModel.swift
//  SwiftUICollaboration
//
//  Created by Sesili Tsikaridze on 06.01.24.
//

import Foundation

// MARK: - DetailsData
struct DetailsData: Decodable {
    let backdropPath: String
    let id: Int
    let name: String
    let numberOfEpisodes, numberOfSeasons: Int
    let overview: String
    let posterPath: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
           case backdropPath = "backdrop_path"
           case id
           case name
           case numberOfEpisodes = "number_of_episodes"
           case numberOfSeasons = "number_of_seasons"
           case overview
           case posterPath = "poster_path"
           case voteAverage = "vote_average"
       }

}

// MARK: - CreatedBy
struct CreatedBy: Decodable {
    let name: String
}

// MARK: - Genre
struct Genre: Decodable {
    let name: String
}


