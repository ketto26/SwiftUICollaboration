//
//  TVSeriesOnAirReviewsModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 06.01.24.
//

import Foundation

struct Review: Codable {
    let id: String
    let author: String
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case content
    }
}
