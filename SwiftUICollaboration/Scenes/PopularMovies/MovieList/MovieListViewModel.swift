//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Natia Khizanishvili on 07.01.24.
//

import Foundation
import NetworkManager

final class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    private let apiKey = "c366522f348edd670db84febe45c9e86"

    func fetchMovies() {
        NetworkService.shared.getData(urlString: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)") { (result: Result<PopularMovieListResponse, Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.movies = response.results
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
