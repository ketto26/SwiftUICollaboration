//
//  MoviesInCinemaViewModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import Foundation
import NetworkManager

struct API {
    static let baseURL = "https://api.themoviedb.org/3"
    static let apiKey = "0457cf9412841fd34455118e6cf20613"
    
    static func nowPlayingMoviesURL() -> String {
        return "\(baseURL)/movie/now_playing?api_key=\(apiKey)"
    }
}

final class MoviesInCinemaViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var selectedMovieReviews: [Review] = []
    @Published var error: Error?
    
    
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
    
    func fetchReviewsForMovie(movieID: Int) {
        let reviewsURL = "https://api.themoviedb.org/3/movie/\(movieID)/reviews?api_key=0457cf9412841fd34455118e6cf20613"

        guard let url = URL(string: reviewsURL) else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching reviews: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                  let data = data else {
                print("Invalid response")
                return
            }

            do {
                let decoder = JSONDecoder()
                let reviewsResponse = try decoder.decode(ReviewsResponse.self, from: data)
                let reviews = reviewsResponse.results
                DispatchQueue.main.async {
                    self.selectedMovieReviews = reviews
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }
        task.resume()
    }
}



