//
//  TVSeriesDetailsViewModel.swift
//  SwiftUICollaboration
//
//  Created by Sesili Tsikaridze on 06.01.24.
//

import NetworkManager
import SwiftUI

final class TVSeriesDetailsViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var tvShowDetails = DetailsData(backdropPath: "", id: 206559, name: "", numberOfEpisodes: 4505, numberOfSeasons: 19, overview: "", posterPath: "", voteAverage: 3.5)
    @Published var currentShowID: Int
    private let apiKey = "0121a87cc86615dcfff388722ec6de80"

    
    // MARK: - Initialisation
    
    init(id: Int) {
        self.currentShowID = id
        fetchShowDetails()
    }
    
    // MARK: - Network Call

    func fetchShowDetails() {
        
        let baseURL = "https://api.themoviedb.org/3/tv/"
        let urlString = "\(baseURL)\(currentShowID)?language=en-US&api_key=\(apiKey)"
        
        NetworkService.shared.getData(urlString: urlString) { [weak self] (result: Result<DetailsData, Error>) in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                tvShowDetails = data
            case .failure(let error):
                print(error)
            }
        }
    }
}

