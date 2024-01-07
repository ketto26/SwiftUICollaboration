//
//  TVSeriesOnAirModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import Foundation

// MARK: - TVSeries Model
struct TVSeries: Decodable, Identifiable {
    let id: Int
    let name: String
    let firstAirDate: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case firstAirDate = "first_air_date"
        case posterPath = "poster_path"
    }
}

// MARK: - TVSeriesResponse Model
struct TVSeriesResponse: Decodable {
    let results: [TVSeries]
}
