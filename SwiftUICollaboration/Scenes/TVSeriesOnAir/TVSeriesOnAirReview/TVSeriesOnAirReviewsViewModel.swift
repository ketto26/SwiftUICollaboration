//
//  TVSeriesOnAirReviewsViewModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 06.01.24.
//

import Foundation
import NetworkManager

struct ReviewResponse: Codable {
    let results: [Review]
}

class SeriesDetailsViewModel: ObservableObject {
    @Published var reviews: [Review] = []
    
    func fetchReviewsForSeries(apiKey: String, seriesID: Int) {
        let reviewEndpoint = "/tv/\(seriesID)/reviews"
        let reviewURLString = "https://api.themoviedb.org/3\(reviewEndpoint)?api_key=\(apiKey)"
        
        NetworkService.shared.getData(urlString: reviewURLString) { (result: Result<ReviewResponse, Error>) in
            switch result {
            case .success(let decodedData):
                DispatchQueue.main.async {
                    self.reviews = decodedData.results
                }
            case .failure(let error):
                print("Error fetching reviews: \(error.localizedDescription)")
            }
        }
    }
}
