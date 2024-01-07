//
//  TVSeriesOnAirViewModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import Foundation
import NetworkManager

final class TVSeriesViewModel: ObservableObject {
    // MARK: - Properties
    @Published var tvSeries: [TVSeries] = []
    
    let apiKey = "d8ff3e307af3e5b687d07d89d33e6128"
    let baseURL = "https://api.themoviedb.org/3"
    let endpoint = "/tv/on_the_air"
    
    // MARK: - Methods
    func fetchTVSeries() {
        let urlString = "\(baseURL)\(endpoint)?api_key=\(apiKey)"
        
        NetworkService.shared.getData(urlString: urlString) { (result: Result<TVSeriesResponse, Error>) in
            switch result {
            case .success(let decodedData):
                DispatchQueue.main.async {
                    self.tvSeries = decodedData.results
                }
            case .failure(let error):
                print("Error fetching TV series: \(error.localizedDescription)")
            }
        }
    }
}
