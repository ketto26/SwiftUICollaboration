//
//  MoviesInCinemaViewModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import Foundation
import NetworkManager



// MARK: - API

struct API {
    static let baseURL = "https://api.themoviedb.org/3"
    static let apiKey = "0457cf9412841fd34455118e6cf20613"
    
    static func nowPlayingMoviesURL() -> String {
        return "\(baseURL)/movie/now_playing?api_key=\(apiKey)"
    }
}

// MARK: - MoviesInCinemaViewModel

final class MoviesInCinemaViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var selectedMovieReviews: [MoviesReview] = []
    @Published var error: Error?
    
    init() {
            fetchNowPlayingMovies()
    }
    
    // MARK: - FetchNowPlayingMovies

    func fetchNowPlayingMovies() {
        let urlString = API.nowPlayingMoviesURL()
        
        NetworkService.shared.getData(urlString: urlString) { (result: Result<ResultsList, Error>) in
            switch result {
            case .success(let decodedObject):
                DispatchQueue.main.async {
                    self.movies = decodedObject.results
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error
                }
            }
        }
    }
    
    // MARK: - fetchReviewsForMovie

    func fetchReviewsForMovie(movieID: Int) {
        let reviewsURL = "https://api.themoviedb.org/3/movie/\(movieID)/reviews?api_key=0457cf9412841fd34455118e6cf20613"

        NetworkService.shared.getData(urlString: reviewsURL) { (result: Result<MoviesReviewsResponse, Error>) in
            switch result {
            case .success(let reviewsResponse):
                DispatchQueue.main.async {
                    self.selectedMovieReviews = reviewsResponse.results
                }
            case .failure(let error):
                print("Error fetching reviews: \(error)")
            }
        }
    }
}



