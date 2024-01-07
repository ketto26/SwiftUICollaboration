//
//  MoviesInCinemaModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import Foundation

struct ResultsList: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let title: String
    let posterPath: String
    let overview: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, posterPath = "poster_path", overview, voteAverage = "vote_average"
    }
}

struct ReviewsResponse: Decodable {
    let results: [Review]
}


struct Review: Decodable {
    let id: String
    let author: String
    let content: String
    let createdAt: String
    let updatedAt: String
    let url: String
    let authorDetails: AuthorDetails?
    
    enum CodingKeys: String, CodingKey {
        case id, author, content
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case url
        case authorDetails = "author_details"
    }
}

struct AuthorDetails: Decodable {
    let name: String
    let username: String
    let avatarPath: String?
    let rating: Int
    
    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}





