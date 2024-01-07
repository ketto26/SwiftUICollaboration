//
//  PopularTVSeriesViewModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import NetworkManager
import SwiftUI


final class PopularTVSeriesViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var tvShows = [TVShow]()
    private let apiKey = "0121a87cc86615dcfff388722ec6de80"

    
    // MARK: - Initialisation
    
    init() {
        fetchTVShows()
    }

    // MARK: - Network Call
    
    func fetchTVShows() {
        
        let baseURL = "https://api.themoviedb.org/3/tv/popular"
        let urlString = "\(baseURL)?language=en-US&page=1&api_key=\(apiKey)"
        
        NetworkService.shared.getData(urlString: urlString) { [weak self] (result: Result<TVShowData, Error>) in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                self.tvShows = data.results
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
